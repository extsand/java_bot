# Java Telegram bot
<p align="center">
	<img src="https://github.com/extsand/java_bot.ci_sample/blob/dev-https/app/img/ssl_bots-min%20.png?raw=true" width="auto" height="auto">
</p>
CI/CD pipeline for java telegram bot

Include original project from:<br> https://github.com/Kutsepalov/ZNOshka_bot <br>
Aplication based on Spring Boot


### Project description
CI Application deploys to AWS with SSl certificate. Full HTTPS access for Application main page and Telegram API friendly  environment.
<br>
<br>
<b>IMPORTANT</b>
<br>
The Main branch includes only blueprints and example for project structure. For working CI project check [dev-https](https://github.com/extsand/java_bot.ci_sample/tree/dev-https) and  [dev-java](https://github.com/extsand/java_bot.ci_sample/tree/dev-java) branches. Also for experiments with AWS infrastructure, you can use [simple python echo bot](https://github.com/extsand/echo_bot_py).




### Folder structure:
1. App - Java application
2. Iac-modules - Terraform modules
3. Drafts - all non-sensitive data for development
4. Providers - Terragrunt work folder


### Useful link
Spring Boot
https://spring.io/guides/gs/spring-boot/
<br>
Telegram API
https://core.telegram.org/bots/api
<br>
Terraform
https://www.terraform.io/
<br>
Terragrunt
https://terragrunt.gruntwork.io/
<br>
AWS
https://aws.amazon.com/





