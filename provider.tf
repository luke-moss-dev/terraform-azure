#- Initial plans to support five (5) ?  subscriptions

# Default - used mostly to grab initial data set of avail subs
provider "azurerm" {
  features {}
}

#- Subscription 1 as mapped in z.LOCALS.tf
provider "azurerm" {
  alias                      = "sub1"
  skip_provider_registration = true
  features {}

  subscription_id = coalesce(join("", [for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id if sub.display_name == local.sub1]), data.azurerm_subscription.current.subscription_id)
}

#- Subscription 2 as mapped in z.LOCALS.tf
provider "azurerm" {
  alias                      = "sub2"
  skip_provider_registration = true
  features {}

  subscription_id = coalesce(join("", [for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id if sub.display_name == local.sub2]), data.azurerm_subscription.current.subscription_id)
}

#- Subscription 3 as mapped in z.LOCALS.tf
provider "azurerm" {
  alias                      = "sub3"
  skip_provider_registration = true
  features {}

  subscription_id = coalesce(join("", [for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id if sub.display_name == local.sub3]), data.azurerm_subscription.current.subscription_id)
}

#- Subscription 4 as mapped in z.LOCALS.tf
provider "azurerm" {
  alias                      = "sub4"
  skip_provider_registration = true
  features {}

  subscription_id = coalesce(join("", [for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id if sub.display_name == local.sub4]), data.azurerm_subscription.current.subscription_id)
}

#- Subscription 5 as mapped in z.LOCALS.tf
provider "azurerm" {
  alias                      = "sub5"
  skip_provider_registration = true
  features {}

  subscription_id = coalesce(join("", [for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id if sub.display_name == local.sub5]), data.azurerm_subscription.current.subscription_id)
}

data "azurerm_subscriptions" "available" {}
data "azurerm_subscription" "current" {}

output "subscriptions" {
  value = data.azurerm_subscriptions.available
}
output "current_sub" {
  value = data.azurerm_subscription.current
}