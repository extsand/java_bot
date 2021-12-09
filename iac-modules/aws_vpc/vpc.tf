resource "aws_vpc" "vpc_app" {
	cidr_block = var.vpc_cidr_block
	tags = {
		Name = "${local.name_generator}-VPC"
	}
}

resource "aws_internet_gateway" "vpc_internet_gw" {
	vpc_id = aws_vpc.vpc_app.id
	tags = {
		Name = "${local.name_generator}-VPC-igw"
	}
}

resource "aws_route_table" "rt_internet_gw" {
	vpc_id = aws_vpc.vpc_app.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.vpc_internet_gw.id
	}
	tags = {
		Name = "${local.name_generator}-Route-table-to-igw"
	}
}

resource "aws_subnet" "public" {
	vpc_id = aws_vpc.vpc_app.id
	count = var.aws_az_count
	cidr_block = "10.0.1${count.index}.0/24"
	availability_zone = data.aws_availability_zones.available.names[count.index]
	map_public_ip_on_launch = true

	tags = {
		Name = "${local.name_generator}-Public_subnet-${count.index}"
	}
}

resource "aws_subnet" "private" {
	vpc_id = aws_vpc.vpc_app.id
	count = var.aws_az_count
	cidr_block = "10.0.2${count.index}.0/24"
	availability_zone = data.aws_availability_zones.available.names[count.index]
	map_public_ip_on_launch = false

	tags = {
		Name = "${local.name_generator}-Private_subnet-${count.index}"
	}
}

#Create Route table association for Public subnets
resource "aws_route_table_association" "association_public_to_internet_gw" {
	count = var.aws_az_count
	subnet_id = element(aws_subnet.public.*.id, count.index)
	route_table_id = aws_route_table.rt_internet_gw.id
}

#Create NAT for Private Subnet
#don't forget NAT install only to Public subnet!
resource "aws_eip" "eip_for_nat" {
	count = var.aws_az_count
	vpc = true
	depends_on = [
		aws_internet_gateway.vpc_internet_gw
	]
	tags = {
		Name = "${local.name_generator}-Eip-for-NAT-${count.index}"
	}
}

resource "aws_nat_gateway" "nat_private_gw" {
	count = var.aws_az_count
	allocation_id = element(aws_eip.eip_for_nat.*.id, count.index)
	subnet_id = element(aws_subnet.public.*.id, count.index)
	tags = {
		Name = "${local.name_generator}-NAT-private-igw"
	}
}

resource "aws_route_table" "rt_for_private_to_nat" {
	count = var.aws_az_count
	vpc_id = aws_vpc.vpc_app.id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = element(aws_nat_gateway.nat_private_gw.*.id, count.index)
	}
	tags = {
		Name = "${local.name_generator}-Route-table-to-NAT-gw"
	}
}

resource "aws_route_table_association" "association_private_to_nat" {
	count = var.aws_az_count
	subnet_id = element(aws_subnet.private.*.id, count.index)
	route_table_id = element(aws_route_table.rt_for_private_to_nat.*.id, count.index)
}

