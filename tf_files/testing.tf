terraform {  
    required_providers {  
        harness = {  
            source = "harness/harness"  
            version = "0.28.2"  
        }  
    }  
}



provider "harness" {  
    endpoint   = "https://app.harness.io/gateway"  
    account_id = "fQlxjFqlTgqv_gPDCPsIcA"  
    platform_api_key    = "pat.fQlxjFqlTgqv_gPDCPsIcA.652acddc836d1f1c842d9b72.tLWVdZHWma2G4QckLfiK"  
}