terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# # Pulls the image
# resource "docker_image" "ubuntu" {
#   name = "ubuntu:latest"
# }

# # Create a container
# resource "docker_container" "foo" {
#   image = docker_image.ubuntu.image_id
#   name  = "foo"
# }

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# resource "docker_volume" "shared_volume" {
#   name = "shared_volume"
# }

# Create a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "web-server"
  ports {
    internal = 80
    external = 8000
  }
  volumes {
    # volume_name = "shared_volume"
    container_path = "/usr/share/nginx/html"
    host_path = "/tmp/tutorial/www"
  }
}

# # Create a container
## auto port e.g. :55000
# resource "docker_container" "foo" {
#   image = docker_image.nginx.image_id
#   name  = "foo"
#   publish_all_ports = true
# }


