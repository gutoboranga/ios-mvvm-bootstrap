# TEMPLATES_FOLDER="./templates"
#
# VIEW_CONTROLLER_XIB_FILENAME="view-controller-xib.xml"

SCREEN_NAME_TAG="SCREEN_NAME_TAG"
USERNAME_TAG="USERNAME_TAG"
PROJECT_NAME_TAG="PROJECT_NAME_TAG"

SCREEN_NAME=$1
PROJECT_NAME=$2
USERNAME=$3

create() {

    # Set path variables
    NEW_FOLDER_NAME="${SCREEN_NAME}Screen"
    VIEW_FOLDER="${NEW_FOLDER_NAME}/View"
    VIEW_MODEL_FOLDER="${NEW_FOLDER_NAME}/ViewModel"
    ROUTER_FOLDER="${NEW_FOLDER_NAME}/Router"

    # Remove folder with old name, if there was
    rm -rf $NEW_FOLDER_NAME

    # Create folders
    mkdir $NEW_FOLDER_NAME
    mkdir $VIEW_FOLDER
    mkdir $VIEW_MODEL_FOLDER
    mkdir $ROUTER_FOLDER

    # File names
    VIEW_CONTROLLER_XIB="${VIEW_FOLDER}/${SCREEN_NAME}ViewController.xib"
    VIEW_CONTROLLER_SWIFT="${VIEW_FOLDER}/${SCREEN_NAME}ViewController.swift"
    VIEW_MODEL_SWIFT="${VIEW_MODEL_FOLDER}/${SCREEN_NAME}ViewModel.swift"
    VIEW_MODEL_DELEGATE_SWIFT="${VIEW_MODEL_FOLDER}/${SCREEN_NAME}ViewModelDelegate.swift"
    ROUTER_SWIFT="${ROUTER_FOLDER}/${SCREEN_NAME}Router.swift"

    # Replace tags in templates with name provided and save to file
    replace templates/view-controller-xib.xml $VIEW_CONTROLLER_XIB
    replace templates/view-controller.txt $VIEW_CONTROLLER_SWIFT
    replace templates/view-model.txt $VIEW_MODEL_SWIFT
    replace templates/view-model-delegate.txt $VIEW_MODEL_DELEGATE_SWIFT
    replace templates/router.txt $ROUTER_SWIFT

    echo "${SCREEN_NAME}Screen created!"
}

replace() {
    SOURCE=$1
    DESTINATION=$2
    sed -e "s/${SCREEN_NAME_TAG}/${SCREEN_NAME}/g" -e "s/${USERNAME_TAG}/${USERNAME}/g" -e "s/${PROJECT_NAME_TAG}/${PROJECT_NAME}/g" $SOURCE > $DESTINATION
}

# Functions to check input
username_ok() {
    if test -z $USERNAME; then return 1; else return 0; fi
}

screen_name_ok() {
    if test -z $SCREEN_NAME; then return 1; else return 0; fi
}

project_name_ok() {
    if test -z $PROJECT_NAME; then return 1; else return 0; fi
}

# Main
if username_ok && screen_name_ok && project_name_ok
then
    create
else
    echo "[Erro] Parâmetros faltando. Formato correto:"
    echo "\t ./run.sh <NOME DA PASTA> <NOME DO PROJETO> <NOME DO USUÁRIO>"
fi
