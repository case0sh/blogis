group "default" {
  targets = ["build"]
}
target "docker-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action"]
  context = "./"
  dockerfile = "Dockerfile"
  platforms = [
    "linux/amd64",
    "linux/aarm64v8"
  ]
  output = ["."]
}