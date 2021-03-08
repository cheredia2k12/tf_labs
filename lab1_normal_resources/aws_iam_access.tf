#Si bien es posible crear roles, politicas, permisos por terraform, prefiero
#hay que tener mucho cuidado con las definiciones y los permisos declarados.
/*
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

resource "aws_iam_access_key" "admin1-access" {
    user = "${aws_iam_user.admin1.name}"
}

resource "aws_iam_access_key" "admin2-access" {
    user = "${aws_iam_user.admin2.name}"
}

output "admin1_access_key" {
    value = "${aws_iam_access_key.admin1-access.id}"
}

output "admin1_secret_key" {
    value = "${aws_iam_access_key.admin1-access.secret}"
}

output "admin2_access_key" {
    value = "${aws_iam_access_key.admin2-access.id}"
}

output "admin2_secret_key" {
    value = "${aws_iam_access_key.admin2-access.secret}"
}
*/
