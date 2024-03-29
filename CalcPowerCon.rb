# puts 'Hello World!'
# power consumption
powercon1806 = {\
18754 => '2009.07.05', \
18838 => '2009.07.11', \
19243 => '2009.08.16', \
19670 => '2009.09.30', \
19752 => '2009.10.14', \
21427 => '2010.01.15', \
21535 => '2010.01.22', \
21707 => '2010.02.02', \
22509 => '2010.04.02', \
22952 => '2010.05.03', \
23235 => '2010.06.05', \
23381 => '2010.06.26', \
23691 => '2010.07.18', \
24590 => '2010.10.16', \
25801 => '2011.01.16', \
26515 => '2011.03.23', \
27291 => '2011.06.12', \
27636 => '2011.07.16', \
27935 => '2011.08.07', \
28875 => '2011.11.19', \
29610 => '2012.01.21', \
29892 => '2012.02.09', \
30972 => '2012.05.19', \
31436 => '2012.07.07', \
31776 => '2012.07.26', \
31856 => '2012.08.01', \
33052 => '2012.11.29', \
33689 => '2013.01.11', \
33777 => '2013.01.19', \
33869 => '2013.01.26', \
33955 => '2013.02.03', \
34016 => '2013.02.08', \
34223 => '2013.02.23', \
34362 => '2013.03.08', \
34443 => '2013.03.17', \
34694 => '2013.03.30', \
34803 => '2013.04.04', \
35073 => '2013.04.21', \
35160 => '2013.05.01', \
35249 => '2013.05.11', \
35387 => '2013.05.28', \
36070 => '2013.07.30', \
36739 => '2013.09.22', \
36812 => '2013.10.10', \
37665 => '2013.12.21', \
38011 => '2014.01.23', \
38403 => '2014.02.28', \
38681 => '2014.03.26', \
38841 => '2014.04.12', \
39070 => '2014.05.19', \
39178 => '2014.05.30', \
39415 => '2014.06.28', \
}

powercon1801 = {\
138 => '2012.11.29', \
637 => '2013.01.11', \
720 => '2013.01.19', \
787 => '2013.01.26', \
871 => '2013.02.03', \
923 => '2013.02.08', \
1041 => '2013.02.23', \
1134 => '2013.03.08', \
1186 => '2013.03.17', \
1385 => '2013.03.30', \
1464 => '2013.04.04', \
1620 => '2013.04.21', \
1652 => '2013.05.01', \
1713 => '2013.05.11', \
1863 => '2013.05.28', \
2353 => '2013.07.30', \
2904 => '2013.09.22', \
2992 => '2013.10.10', \
3474 => '2013.12.21', \
3671 => '2014.01.23', \
3862 => '2014.02.28', \
4001 => '2014.03.26', \
4106 => '2014.04.12', \
4308 => '2014.05.19', \
4385 => '2014.05.30', \
4438 => '2014.06.28', \
}

def calc_pc(data, reach)
  last = Time.new
  lastpc = 0
  checktime = 3600 * 24 * 30 * 4
  puts ''
  puts 'reach value: ' + reach.to_s
  data.each { |pc, date|
    curr = Time.local(date[0, 4].to_i, date[5, 2].to_i, date[8, 2].to_i)
    currpc = pc
    if Time.new - curr <= checktime
      pc_per_second = (currpc - lastpc) / (curr - last)
      if pc_per_second > 0
        destdate = curr + (reach - currpc) / pc_per_second
        puts curr.strftime('on %Y-%m-%d  ') + destdate.strftime('dest date:%Y-%m-%d  average pc per day:') + '%3.2f' % (pc_per_second * 3600 * 24).to_s
      end
    else
      lastpc = currpc
      last = curr
    end
  }
end

calc_pc(powercon1806, 41000-200)
calc_pc(powercon1801, 4731-200)