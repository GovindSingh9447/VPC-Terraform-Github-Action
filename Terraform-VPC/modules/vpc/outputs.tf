output "vpc_id" {
    value = aws_vpc.rwt_vpc.id
}

output "subnet_ids" {
    value = aws_subnet.subnet.*.id
}