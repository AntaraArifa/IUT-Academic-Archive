 #include <bits/stdc++.h>
 using namespace std;

 int main()
 {
     string line;
     int n;
     vector<int>nums;

     getline(cin, line);
     istringstream stream(line);

     while(stream >> n)
     {
         nums.push_back(n);
     }

     int x=nums.size();

     int arr[100000]={0};

     for(int i=0;i<x;i++)
     {
         arr[nums[i]]++;
     }

     for(int i=0;i<100000;i++)
     {
         if(arr[i]!=0)
         {
             for(int j=0;j<arr[i];j++)
             {
                 cout<<i<<" ";
             }
         }
     }

 }
