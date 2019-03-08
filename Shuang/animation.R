score_faible=seq(0,1,0.01)
score_fort=1-score_faible
nbscore=seq(1,25,2)
fort_or_faible=c("fort","faible")
p_score_faible=numeric()
p_score_fort=numeric()
score=numeric()
win_faible=numeric()
win_fort=numeric()
pp=numeric()
ff=numeric()
j=0
# score impaire
for (p in 1:length(score_faible))
{j=j+1
  for (g in 1:length(nbscore))
{
pp=c(pp,j)
win_faible=append(win_faible,pbinom(nbscore[g]/2,nbscore[g],score_fort[p]))
win_fort=append(win_fort,pbinom(nbscore[g]/2,nbscore[g],score_faible[p]))
p_score_faible=append(p_score_faible,score_faible[p])
p_score_fort=append(p_score_fort,score_fort[p])
score=append(score,nbscore[g])
if (score_faible[p]<=0.5)
  ff=c(ff,1)
else (ff=c(ff,2))
  }
  }
# Loi poisson()


# x11()
# plot(score,win_fort,col="red",ylim = c(0,1))
# points(score,win_faible,col="blue")
# 
# 
# library(ggplot2)
# x11()
# df=data.frame(x=score,y=win_fort)
# base=ggplot(df,aes(x,y))
# base+
#   geom_segment(aes(xend=x,yend=y),size=10)+
#   #geom_col(width = 0.5,fill="black")+#ou geom_bar(stat="identity"),defaut is count
#   #geom_bar(width = 0.5,fill="black")
#   geom_text(aes(label=y),nudge_y = 0.05)
# 
# 
# bg="#1E8449"
# par(bg=bg,fg="white",col.axis="white",col.lab="white")
# barplot(rbind(win_faible,win_fort),
#         beside = F)

# install.packages( "devtools")
# library(devtools)
# install_github( "thomasp85/gganimate")

# install.packages("installr")
# installr::install.ImageMagick("http://www.imagemagick.org/script/download.php")
# 
# # Set path of Rtools
# 
# Sys.setenv(PATH = paste(Sys.getenv( "PATH"), "*InstallDirectory*/Rtools/bin/", "*InstallDirectory*/Rtools/mingw_64/bin", sep = ";")) #for 64 bit version Sys.setenv(BINPREF = "*InstallDirectory*/Rtools/mingw_64/bin")
# 
# library(devtools)
# 
# #Manually "force" version to be accepted
# 
# assignInNamespace( "version_info", c(devtools:::version_info, list( "3.5"= list(version_min = "3.3.0", version_max = "99.99.99", path = "bin"))), "devtools") 
# find_rtools() # is TRUE now
# 
# # Now you can install gganimate
# 
# devtools::install_github( "thomasp85/gganimate",force = TRUE)


library(ggplot2)
library(gganimate)

col=c("black","red")
df1=cbind(x=score,y=win_faible,win_fort,p_score_faible,p_score_fort,pp,ff)
df=as.data.frame(df1)
ggplot(df, aes(x, y)) +
  geom_point(size=5,color=col[ff])+scale_x_continuous(breaks=nbscore)+
  #facet_wrap(~function_name) +
  #labs(title = 'when it occurs a goal ,the probabilty of this team make it: 0,{round(frame_time,0)}', x = 'Nomber of the score in this game', y = 'probabilty of win') +
  labs( title ="courbe is decreasing or increasing as the change of p?" ,x = 'Nomber of the score in this game', y = 'probabilty of win') +
  transition_time(pp) +
  geom_text(aes(x=13,y=0.6,label="when it occurs a goal,"),cex=9,color="grey")+
  geom_text(aes(x=13,y=0.5,label="the probabilty of this team make it :"),cex=9,color="grey")+
  geom_text(aes(x=13,y=0.4,label=round(p_score_faible,2)),cex=12,color="grey")+
  ease_aes('linear')

anim_save("D:/M1/gganimate/")
#gganimate(p2,interval = .5,"output2.gif")


library(gapminder) 
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, color=continent))+geom_point()+scale_x_log10() +
  transition_time(year) + ease_aes('linear')

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

# library(ggplot2)
# library(gganimate)
# #1
# data <- read.table('C:csv', header=T, sep=',')
# #2
# ggplot(data, aes(UV, PV,color=user_type)) +
#   geom_point() +
#   facet_wrap(~function_name) + 
#   labs(title = 'Day: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
#   transition_time(level) +
#   ease_aes('linear')
