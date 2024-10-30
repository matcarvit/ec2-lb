<h1>EC2 + Load Balancer - Terraform Platform</h1>
Código Terraform para provisionamento de um EC2 com Balanceador de Carga do tipo Rede, bem como também com todas as portas necessárias e grupos de segurança.

<h3>Autor</h3>
<li>Weslley Matos de Carvalho</li>
<li>Linkedin: <a href="https://linkedin.com/in/matcarv">https://linkedin.com/in/matcarv</a></li>
<li>E-mail: <a href="mailto:contato@matcarv.com">contato@matcarv.com</a>

<h3>Versões</h3>
<li>Terraform versão 1.2.5</li>
<li>AWS Provider versão 4.12.0</li>

<h3>Comandos</h3>

`terraform init`<br />
`terraform plan`<br />
`terraform apply --auto-approve`

<h3>Orientações</h3>
<li>No arquivo <b>main.tf</b> e <b>variables.tf</b>, subistitua os valores <i>"YOUR-***"</i> pelos valores que correspondem ao seu ambiente cloud.</li>
<li>Após o provisionamento, deverá acessar o servidor via SSH para a configuração da VPN (descomente em <b>security-group.tf</b> a porta 22).</li>
<li>No MarketPlace da AWS, escolha a AMI da OpenVPN que corresponde à necessidade do seu negócio.</li>
<br />

<i>`Lembre-se de configurar o main.tf e apontar o bucket S3, onde são armazenados os estados do provisionamento Terraform.`</i>

