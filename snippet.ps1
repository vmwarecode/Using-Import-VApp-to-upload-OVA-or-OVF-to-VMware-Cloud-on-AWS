$ova = "C:\Users\primp\Desktop\photon-custom-hw11-1.0-13c08b6.ova"
$vmName = "VMC-Import-VApp-Test"
$network = "sddc-cgw-network-1"

$datastore = Get-Datastore -Name "WorkloadDatastore"
$vmhost = Get-Cluster -Name Cluster-1 | Get-VMHost | select -First 1
$location = Get-ResourcePool -Name "Compute-ResourcePool"
$folder = Get-Folder -Name "Workloads"
$ovaConfig = Get-OvfConfiguration -Ovf $ova
$ovaConfig.NetworkMapping.None.Value = $network

Import-VApp -OvfConfiguration $ovaConfig -Source $ova -Name $vmName -VMHost $vmhost -Datastore $datastore -DiskStorageFormat thin -Location $location -InventoryLocation $folder