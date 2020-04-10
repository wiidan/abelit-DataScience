import os
import shutil

os.chdir("./webapp")

# os.system("npm run build")


shutil.copy('./dist/index.html','../datascience/templates/index.html')
shutil.copy('./dist/favicon.ico','../datascience/static/favicon.ico')
# # shutil.copytree('./dist/static/*','../datascience/static/*')
print(os.listdir('./dist/static'))

for i in os.listdir('./dist/static'):
    shutil.copytree('./dist/static/'+i,'../datascience/static/'+i)