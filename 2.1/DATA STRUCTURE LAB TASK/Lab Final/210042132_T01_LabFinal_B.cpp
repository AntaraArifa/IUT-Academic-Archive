#include <iostream>
#include <queue>

using namespace std;

int main()
{
    int N;
    priority_queue <int> p;
    while(cin >> N)
    {
        if(N == -1)
            break;
        p.push(N);
    }

    while(p.size() > 1)
    {
        int x1 = p.top();
        p.pop();
        int x2 = p.top();

    }

    if(p.empty())
        cout << 0 << '\n';
    else
        cout << p.top() << '\n';

    return 0;
}
