## IMPORTANT: this file and accompanying assets are the source for snippets in https://docs.microsoft.com/azure/machine-learning! 
## Please reach out to the Azure ML docs & samples team before before editing for the first time.

# <installation>
# az extension add -n ml
# </installation>

# <create resource group>
az group create -n azureml-examples -l eastus
# </create resource group>

# <create_workspace>
az ml workspace create --name main -g azureml-examples
# </create_workspace>

# <configure-defaults>
az configure --defaults workspace="default"
az configure --defaults location="eastus"
az configure --defaults group="azureml-examples"
# </configure-defaults>

# <create compute>
#az ml compute create -n gpu-cluster --min-instances 0 --max-instances 20 --size Standard_NC24_v3
# </create compute>

# <create a basic job>
job_id=`az ml job create -f jobs/train/deepspeed/transformers/test.yml -o tsv | cut -f11`
# </create a basic job>

# <show job in studio>
az ml job show -n $job_id --web
# </show job in studio>

# <stream job logs to console>
az ml job stream -n $job_id
# </stream job logs to console>

# <download outputs>
az ml job download -n $job_id --outputs
# </download outputs>

# <create endpoint>
#az ml endpoint create
# </create endpoint>

# <score endpoint>
#curl something | something
# </score endpoint>

# <create a sweep job>
#job_id=`az ml job create -f jobs/train/lightgbm/iris/sweep.yml -o tsv | cut -f11`
#az ml job stream -n $job_id
# </create a sweep job>