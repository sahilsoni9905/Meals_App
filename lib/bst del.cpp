#include <bits/stdc++.h>
using namespace std;

struct node{
    int info;
    struct node* left;
    struct node* right;

      node(int x){
        info = x;
        left=right= NULL;
    }
};



struct node* creation(struct node*&root ,int val){
    if(root==NULL) return new node(val);
    

    if(val < root->info) root->left=creation(root->left,val);

    else if(val > root->info) root->right=creation(root->right,val);

    return root;


}

struct node *deleteNode(node *root, int key) {
    if( root==NULL ) return NULL;
        if( root->info < key ) root->right = deleteNode(root->right, key);
        else if( root->info > key ) root->left = deleteNode(root->left, key);
        else{
            if( root->right==NULL && root->left==NULL ) return NULL;
            else if( !root->right ) return root->left;
            else if( !root->left ) return root->right;
            else{
                struct node* temp = root->right;
                while( temp->left ) temp = temp->left;
                temp->left = root->left;
                return root->right;
            }
        }
        return root;
    }

void print(struct node*root){
    struct node* temp=root;
    queue<node*> q ;

 q.push(temp) ;
 
    while(!q.empty()){
        int size = q.size() ;
        for(int i=1 ; i <=size ; i++){
            struct node* node = q.front() ;
            q.pop() ;
            cout<<node->info<<" " ;

            if(node->left != NULL) {q.push(node->left) ;}
            if(node->right != NULL) {q.push(node->right) ;}    
 
        }
}
cout<<endl;
}

int main(){
    struct node* root = NULL;

    root=creation(root,10);
    for(int i=1;i<=6;i++){
    creation(root,i);
}
    cout<<"BEFORE"<<endl;
     print(root);

deleteNode(root, 4);

cout<<"AFTER"<<endl;
    print(root);

    


}
