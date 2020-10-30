#!/bin/bash

module purge --force
export SINGULARITY_IMAGE_DIR=/p/project/training2005/geomar_challenge/singularity-kernel
export JUPYTER_KERNEL_NAME=GEOMAR-Singularity

if [ "${1}" == "install" ]; then

singularity pull docker://martinclaus/py-da-stack:latest

elif [ "${1}" == "register" ]; then

export JUPYTER_USER_KERNEL_DIR=${HOME}/.local/share/jupyter/kernels/${JUPYTER_KERNEL_NAME}
mkdir -p ${JUPYTER_USER_KERNEL_DIR}

echo '{
 "argv": [
  "'"${SINGULARITY_IMAGE_DIR}"'/singularity-jupyter-kernel.sh",
  "-f",
  "{connection_file}"
 ],
 "display_name": "'"${JUPYTER_KERNEL_NAME}"'",
 "language": "python"
}' > ${JUPYTER_USER_KERNEL_DIR}/kernel.json

else

singularity run ${SINGULARITY_IMAGE_DIR}/py-da-stack_latest.sif python -m ipykernel $@

fi

