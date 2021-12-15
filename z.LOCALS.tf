# Map the Azure name in portal to these terraform local variables
# Do not leave any blank; place "NA" if not applicable
# Same casing is important right now
# Currently planning to support 5 subscriptions

locals {
  sub1 = "Production"
  sub2 = "Connectivity"
  sub3 = "Azure Virtual Desktop"
  sub4 = "Identity"
  sub5 = "NA"
}