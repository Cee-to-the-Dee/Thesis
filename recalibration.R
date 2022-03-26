setwd('C:/')
a<-function(){
raw<-t(read.table('raw.txt',sep='\t',header=F))
blu<-t(read.table('blur.txt',sep='\t',header=F))

sub<-raw-blu
Wh<-which(sub==min(sub),arr.ind = T)
Sc<-1
for(i in 1:nrow(Wh)){
  r<-as.numeric(Wh[i,1])
  c<-as.numeric(Wh[i,2])
  sc=raw[r,c]/blu[r,c]
  if(sc<Sc){Sc=sc}
}
sub<-raw-blu*Sc
sub[which(sub<0)]<-0
write.table(t(sub),file="PnS.txt",sep='\t',quote=F,row.names=F,col.names=F)}