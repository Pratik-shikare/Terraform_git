variable "gcp_credentials" {
        type=string
        default = "C:/Users/p.mathaji.shikare/Downloads/pratiksproject-357618-d9b86637b4df.json"
    }

variable "region" {
        type=string
        default = "asia-south1"
    }

variable "project" {
        type=string
        default = "pratiksproject-357618"
}

variable "zone" {
        type=string
        default = "asia-south1-a"
    }

variable "vmname" {
        type=string
        default = "instance1"
    }

variable "terra_subnet"{
    type=string
    default = "subnet"
}

variable "terra_firewall"{
    type=string
    default = "test-firewall"
}
variable "machine_type" {
        type=string
        default = "e2-medium"
    }

/*variable "image" {
        type=string
        default = ""
    }
*/
