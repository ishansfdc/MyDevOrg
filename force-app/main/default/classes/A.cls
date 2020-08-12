public class A {
    public List<Wrapperclass> wrapList {get;set;}
    public account acc;
    public account accnewcommit;

    public A() {
        wrapList = new List<Wrapperclass>();
        for( Account acc : [Select id,Name From Account Limit 10] ) {
            wrapList.add( new Wrapperclass(acc,False,wrapList.size() ) );    
        }
    }
    public void doSave(){
        List<Account> accToInsert = new List<Account>();
        Account accToAdd;
        for(Wrapperclass wrap : wrapList) {
            if(wrap.bool) {
                accToAdd = new Account();
                accToAdd.Name = wrap.acc.Name;
                accToInsert.add(accToAdd);
            }
        }
        if( !accToInsert.isEmpty() )
            insert accToInsert;
    }
    
    public class Wrapperclass{
        public Account acc {get;set;}
        public Boolean bool {get;set;}
        public Integer column {get;set;} 
        
      
        
        public Wrapperclass(Account acc,Boolean bool,Integer col) {
            this.acc = acc;
            this.bool = bool;
            column =col;
        }
    }
    
}