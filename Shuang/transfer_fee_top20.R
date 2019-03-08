trfeetop20=readxl::read_xlsx("transfer_fee_top20.xlsx")
head(trfeetop20)
attach(trfeetop20)
ENG=c("red","white","red")
ESP=c("#AD1519","#FABD00","#AD1519")
FRA=c("blue","white","red")
ITA=c("green","white","red")
GER=c("#000000","#ff0000","#ffcc00")

listcol=list(ENG,ESP,FRA,ITA,GRE)
names(listcol)=c("ENG","ESP","FRA","ITA","GRE")
deta=seq(0,2*pi,0.01)
r=average_rest


x11()
bg="bisque"
par(bg=bg,mar=c(0,0,0,0),mai=c(0,0,0,0))
plot(100+r[1]*cos(deta),r[1]*sin(deta),
     xlim=c(-1800,1500),ylim = c(-1500,1500),
     col=rep(ENG,c(30,60,30)),xaxt="n",yaxt="n",bty="n",xlab = '',ylab = '')
points(100+r[3]*cos(deta),r[3]*sin(deta),col=rep(ESP,c(30,30,30)))
points(100+(r[4]-15)*cos(deta),(r[4]-15)*sin(deta),col=rep(FRA,c(30,30,30)))
points(100+r[6]*cos(deta),r[6]*sin(deta),col=rep(ITA,c(30,30,30)))
points(100+r[20]*cos(deta),r[20]*sin(deta),col=rep(GER,c(30,30,30)))

r2=transfer_fee
deta2=seq(0,2*pi,0.001)
library(plotrix)
for (i in 1:length(r2))
#{text(r2[i]*cos(deta2),r2[i]*sin(deta2),labels=Club[i])}
#{points(r2[i]*cos(deta2),r2[i]*sin(deta2),cex=0.001)} 
draw.circle(100,0,radius=r2[i],lwd=0.001)
legend(locator(1),legend = c("From out side to inside:",Club,"ENG","ITA","GER","ESP","FRA"),bty = "n")



# library(ggplot2)
# library(gganimate)
# ggplot(trfeetop20, aes(transfer_fee, transfer_fee,fill=Country), xlim=c(-1500,1500),ylim = c(-1500,1500)) +
#   geom_point(aes(transfer_fee*cos(deta),transfer_fee*sin(deta)))+
# transition_time(transfer_fee)