terraform {  
    required_providers {  
        harness = {  
            source = "harness/harness"  
            version = "<version_number>"  
        }  
    }  
}

provider "harness" {  
    endpoint   = "https://app.harness.io/gateway"  
    account_id = "<your_harness_accountid"  
    platform_api_key    = "your_pat"  
}