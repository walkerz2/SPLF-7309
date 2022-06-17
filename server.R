server = function(input, output) {
  showNotification("Mohon, Tunggu",type="message")
  dataku=reactive({
    url="https://docs.google.com/spreadsheets/d/1t0BpPpeMU2ts0EmQgL2Hf5yOa3ldjIz9LuiVRJLzi9w/edit?usp=sharing"
    gsheet2tbl(url)
  })
  edcod=reactive({
    url="https://docs.google.com/spreadsheets/d/1fUjRHX4HN2n0skF-X3UsfxCkVgR1_SyaIBVkpxK0X-U/edit?usp=sharing"
    gsheet2tbl(url)
  })
  data2=reactive({
    dataku()%>% group_by(Kecamatan) %>%
      summarise(total_target_BS=sum(Target.BS,na.rm = T),total_BS_Selesai=sum(BS_selesai,na.rm = T),total_target_RT=sum(Target.RT,na.rm = T),total_RT_Selesai=sum(RT_selesai,na.rm = T))%>%
      mutate( persen_BS=total_BS_Selesai/total_target_BS)%>%
      mutate( persen_RT=total_RT_Selesai/total_target_RT)%>%
      mutate(color=ifelse(persen_RT<.5,1,ifelse(persen_RT<0.8,2,3)))
  })
  
  
  
  output$Plot <- renderPlot({
    dist <- rnorm(input$obs)
    hist(dist)
  })
}