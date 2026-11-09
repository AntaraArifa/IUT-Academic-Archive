sig student {

enrolled: set course

}

sig course{}

fact Limit{

all c : course | #(enrolled.c) <= 2

}

assert limitcheck{

all c : course | #(enrolled.c) <=2

}
check limitcheck for 3

/*run{
some student
some course
some student.enrolled
} for 3 */
