module "production" {
  source        = "../01_module"

  region        = "ap-northeast-3"
  cidr          = "0.0.0.0/0"
  cidr_main     = "192.168.0.0/16"
  cidr_v6       = "::/0"
  name          = "jhy"
  avazone       = ["a", "c"]
  key           = "tf-key1"
  public_s      = ["10.0.0.0/24", "10.0.2.0/24"]
  private_s     = ["10.0.1.0/24", "10.0.3.0/24"]
  private_dbs   = ["10.0.4.0/24", "10.0.5.0/24"]
  private_ip    = "10.0.0.11"
  zero_port     = 0
  under_port    = 0
  ssh_port      = 22
  http_port     = 80
  mysql_port    = 3306
  prot_http     = "http"
  prot_icmp     = "icmp"
  prot_ssh      = "ssh"
  prot_tcp      = "tcp"
  prot_udp      = "udp"
  instance      = "t2.micro"
  protocol_HTTP = "HTTP"
}