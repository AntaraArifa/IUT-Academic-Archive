#include <iostream>
#include <type_traits>
using namespace std;

class Duck
{
    bool rubber;
public:
    void setRubber(bool value)
    {
        rubber = value;
    }
    virtual void quack()
    {
        cout<<"quack"<<'\n';
    }
};

class RubberDuck: public Duck
{
public:
    RubberDuck()
    {
        setRubber(true);
    }
    void quack()
    {
        cout<<"Artificial Quack"<<'\n';

    }

};

class RealDuck: public Duck
{
public:
    RealDuck()
    {
        setRubber(false);
    }
    void quack()
    {
        cout<<"Real Quack"<<'\n';

    }
};

template <typename T>
    void processData( T value)
    {
        if constexpr (is_same<T, int>::value)
            cout << "Integer: " << value << endl;
        else if constexpr (is_same<T, double>::value)
            cout << "Double: " << value << endl;
        else
            cout << "Unknown Type" << '\n';
    }


int main()
{
    int i = 42;
    double d = 3.14;

    processData(i);
    processData(d);

    Duck *d1 = new RubberDuck();
    Duck *d2 = new RealDuck();
    RealDuck *rd = dynamic_cast<RealDuck*>(d1);

    if(rd)rd->quack();
    else cout<<"Casting Error"<<'\n';

    return 0;
}
