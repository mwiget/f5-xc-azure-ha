include "root" {
  path = find_in_parent_folders()
}

dependency "workloads1" {
  config_path = "../base-azure-region-1"
}

dependency "workloads2" {
  config_path = "../base-azure-region-2"
}

inputs = {
    workload_ip1a = dependency.workloads1.outputs.workload1a_private_ip 
    workload_ip1b = dependency.workloads1.outputs.workload1b_private_ip 
    workload_ip1c = dependency.workloads1.outputs.workload1c_private_ip 

    workload_ip2a = dependency.workloads2.outputs.workload2a_private_ip 
    workload_ip2b = dependency.workloads2.outputs.workload2b_private_ip 
    workload_ip2c = dependency.workloads2.outputs.workload2c_private_ip 
}
