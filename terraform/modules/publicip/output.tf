output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.test.id  
}
