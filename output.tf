output "rendered_manifest" {
  value = data.template_file.landing_zone_manifest.rendered
}
