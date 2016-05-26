set -e
blueprint=$1
block=$(ctx node name)
CONTAINER_ID=$2
BLOCK_NAME=$(ctx node properties block_name)
LIB_DIR=$3

ctx logger info "Execute the block"

sudo docker exec -it ${CONTAINER_ID} jar xf tasks/${BLOCK_NAME} M6CC.mao
sudo docker exec -it ${CONTAINER_ID} java -jar tasks/${BLOCK_NAME} ${blueprint} ${block} ${LIB_DIR}



