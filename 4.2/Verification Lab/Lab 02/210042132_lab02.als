//set of persons with their father and mother and each person can have zero or one father who must be a man and each person can have zero or one mother who must be a woman

sig Person{

father : lone Man,
mother : lone Woman

}

//man is a child of person so he is also a person and he can have zero or one wife

sig Man extends Person{

wife : lone Woman

}

//woman is a child of person so she is also a person and she can have zero or one husband

sig Woman extends Person{

husband : lone Man

}

//every person is either a man or a woman

fact { Man + Woman = Person}

//there is no person in p who is their own ancestor

fact noSelfAncestor {

no p : Person | p in p.^(father + mother)

}

//a man's wife and he should be that woman's husband

fact marriageConsistency{

wife = ~ husband

}

//a man's wife is not his ancestor and a woman's husband is not her ancestor

fact noMarryAncestor {

all m : Man | no m.wife &  m.^(father + mother)

all w : Woman | no w.husband &  w.^(father + mother)

}

assert notSelfAncestor {

no p : Person | p in p.^(father + mother)

}

assert marriageIsConsistenct{

wife = ~ husband

}

assert notMarryAncestor {

all m : Man | no m.wife &  m.^(father + mother)

all w : Woman | no w.husband &  w.^(father + mother)

}

check notSelfAncestor for 5
check marriageIsConsistenct for 5
check notMarryAncestor for 5


