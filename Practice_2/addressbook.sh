if [ ! -f addressbook.txt ]; then
    touch addressbook.txt
fi

add() {
    name="$2"
    email="$3"
    echo "$name:$email" >> addressbook.txt
}

list() {
    if [ -s addressbook.txt ]; then
        cat addressbook.txt | tr ':' ' '
    else
        echo "Addressbook Empty."
    fi
}

remove() {
    name="$2"
    sed -i "/^$name:/d" addressbook.txt
}

clearList() {
    > addressbook.txt
}

lookup() {
    name="$2"
    grep "^$name:" addressbook.txt | while IFS=: read -r found_name email; do
        echo "$found_name $email"
    done
}

case "$1" in
    "new")
        add "$@"
        ;;
    "list")
        list
        ;;
    "remove")
        remove "$@"
        ;;
    "clear")
        clearList
        ;;
    "lookup")
        lookup "$@"
        ;;
    *)
        echo "Unknown Command."
        ;;
esac
