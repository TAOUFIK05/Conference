# trfee=readxl::read_xlsx("transfer_fee.xlsx")
#   read.xlsx("transfer_fee.xlsx",colNames = TRUE)
# head(trfee)


trfee2=readxl::read_xlsx("transfer_fee2.xlsx")
head(trfee2)

LABEL=c("premier Leaque","La liga","Ligue 1","Bundesliga","Serie A")

library(ggplot2)
library(gganimate)





ggplot(trfee2, aes(Country, transfer_fee,fill=Country)) +
  geom_bar(stat= 'identity',position= 'dodge',show.legend =TRUE) +
  scale_x_discrete(labels = LABEL)+
  geom_hline(aes(yintercept =Average))+
 theme(axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.5)) +
  
  # Here comes the gganimate specific bits
  
  labs(title = 'Year: {round(frame_time)}', x = 'League', y = 'TOtal  Transfer Fee') +
  geom_text(aes(x="FRA",y=Average+100,label="Average"),cex=6,color="grey")+
  
  transition_time(YEAR) +
  
  
  ease_aes( 'linear')

# require(animation)
# 
# 
# oopts = ani.options(ffmpeg = "D:/ffmpeg/bin/ffmpeg.exe")
# saveVideo(
#   {ani.options(interval=0.4,nmax=50)
#     ggplot(trfee2, aes(Country, transfer_fee,fill=Country)) +
#       geom_bar(stat= 'identity',position= 'dodge',show.legend =TRUE) +
#       scale_x_discrete(labels = LABEL)+
#       geom_hline(aes(yintercept =Average))+
#       theme(axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.5)) +
#       
#       # Here comes the gganimate specific bits
#       
#       labs(title = 'Year: {round(frame_time)}', x = 'League', y = 'TOtal  Transfer Fee') +
#       geom_text(aes(x="FRA",y=Average+100,label="Average"),cex=6,color="grey")+
#       
#       transition_time(YEAR) +
#       
#       ease_aes( 'linear')
#     
#     
#     
#   },video.name="test3.mp4",other.opts="-b 500k"
# )
# 
# library(animation)
# a = saveGIF({
#   ani.options(interval = 0.5, nmax = 50)
#   par(mar = rep(3, 4))
#   Rosling.bubbles()
# }, movie.name = "RoslingBubbles.gif")
# 
# a = saveGIF({
#   ani.options(interval = 1, nmax = 12)
#   par(mar = rep(3, 4))
#   for (i in seq(pi/2, -4/3*pi, length = 12)) {
#     plot(0, 0, pch = 20, ann = FALSE, axes = FALSE)
#     arrows(0, 0, cos(i), sin(i))
#     axis(1, 0, "VI"); axis(2, 0, "IX")
#     axis(3, 0, "XII"); axis(4, 0, "III"); 
#     box()
#   }}, movie.name = "Clock.gif")
# 
# 
# a = saveVideo({
#   ani.options(interval = 2, nmax = 50)
#   par(mar = rep(3, 4))
#   for (i in seq(pi/2, -4/3*pi, length = 12)) {
#     plot(0, 0, pch = 20, ann = FALSE, axes = FALSE)
#     arrows(0, 0, cos(i), sin(i))
#     axis(1, 0, "VI"); axis(2, 0, "IX")
#     axis(3, 0, "XII"); axis(4, 0, "III"); 
#     box()
#   }}, video.name = "Clock.mp4")
# 
# 
# a = saveVideo({
#   ani.options(interval = 0.5, nmax = 10)
#   par(mar = rep(3, 4))
#   Rosling.bubbles()
# }, Video.name = "RoslingBubbles.mp4")
# 
