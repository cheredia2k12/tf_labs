#Si bien es posible crear roles, politicas, permisos por terraform, prefiero
#crearlos a mano para tener mas control

resource "aws_iam_group" "admins" {
    name = "Administradores"
}

resource "aws_iam_policy_attachment" "admins-attach" {
    name = "admins-attach"
    groups = [ "${aws_iam_group.admins.name}" ]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "admin1" {
    name = "admin1"
}

resource "aws_iam_user" "admin2" {
    name = "admin2"
}

resource "aws_iam_group_membership" "admins-users" {
    name = "admins-users"
    users = [
        "${aws_iam_user.admin1.name}",
        "${aws_iam_user.admin2.name}"
    ]
    group = "${aws_iam_group.admins.name}"
}