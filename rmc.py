import subprocess as sp


running_docker_containers = sp.check_output("docker ps -q", shell=True, text=True).rstrip().split("\n")
all_docker_containers = sp.check_output("docker ps -aq", shell=True, text=True).rstrip().split("\n")

for container_id in all_docker_containers:
    if container_id not in running_docker_containers:
        command = f"docker rm {container_id}" 
        sp.run(command, shell=True)
        print(f"container {container_id} deleted successfully")

#deleet all images except images with the name debian
images = sp.check_output("docker images -aq", shell=True, text=True).rstrip().split("\n")
for image in images:
    if (images != "d2a2c1ada45a"):
        sp.run(f"docker rmi {image}", shell=True)
    
# for container in all_docker_containers:
# print(all_docker_containers)

