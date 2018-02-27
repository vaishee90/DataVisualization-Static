myColor <- c("green", "red")
lineColor <- c("#D4F8FC")
Win_status <- factor(TidiedData$win_status)

#plot for bar chart
b <- ggplot(TidiedData, aes(y=winning_both_serves, x=return, fill = factor(year))) + scale_color_grey() + theme_classic()

#plot for scatter plot
s <- ggplot(TidiedData, aes(y=winning_both_serves, x=return)) + scale_color_discrete()

b + geom_bar(stat="identity", position = position_dodge()) + facet_wrap(ncol = 10, ~year)

s + geom_point(aes(shape=factor(win_status), size=total, colour=factor(win_status))) + 
  theme(panel.background = element_rect(fill = "white"), axis.line = element_line(colour = "black")) +
  facet_wrap(nrow = 10, ~year) + 
  geom_line()

s + geom_point(aes(shape=factor(win_status), size=total, colour=factor(win_status))) + 
  theme(panel.background = element_rect(fill = "white"), axis.line = element_line(colour = "black")) +
  facet_wrap(nrow = 10, ~year) + 
  geom_label_repel(aes(colour=factor(win_status),label=player),point.padding = -0.5,label.padding = 0.2,box.padding = 1,segment.colour = "NA") +
  geom_area(aes(colour = "black"))

#v <- table(TidiedData$winning_both_serves, TidiedData$return)
#barplot(v, col = c("darkblue", "red"), legend = rownames(TidiedData$year))

b + geom_bar(aes(fill = win_status), position = position_dodge()) +
  coord_flip() + facet_wrap(nrow = 10, ~year)

b + geom_bar(stat="identity", position = position_dodge(width = 100)) + facet_wrap(ncol = 10, ~year)  +
  geom_point(aes(shape=factor(win_status), colour=factor(win_status), size = 10)) + scale_size(guide = "none") +
  theme_minimal() + ggtitle("Relationship between return and winning 1st and 2nd serves") + 
  theme(plot.title = element_text(hjust = 0.5), panel.border = element_rect(colour = "grey70", fill = NA))







