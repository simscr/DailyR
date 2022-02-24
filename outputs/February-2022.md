# 20220201: #TidyTuesday and Dog Breeds

# 20220202 - 20220203: Custom `ggplot` Theme

Just for fun, I’m going to setup a custom plotting theme for ggplot. I
may incorporate this into `crsp` if it seems useful.

    mtcars %>% 
      ggplot(aes(hp, mpg, fill = as.factor(cyl))) + 
      geom_smooth(method = "lm", se = FALSE, color = "black") + 
      geom_point(shape = 21, size = 4) + 
      scale_fill_manual(values = hexes) +
      labs(title = "No Theme", subtitle = "test 2", x = "Horse Power", y = "MPG", fill = "Cylinders")

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/crsp-theme-2-1.png" width="672" />

    mtcars %>% 
      ggplot(aes(hp, mpg, fill = as.factor(cyl))) + 
      geom_smooth(method = "lm", se = FALSE, color = "black") + 
      geom_point(shape = 21, size = 4) + 
      scale_fill_manual(values = hexes) +
      labs(title = "theme_crsp", subtitle = "test 2", x = "Horse Power", y = "MPG", fill = "Cylinders") +
      theme_crsp()

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/crsp-theme-2-2.png" width="672" />

# 20220204: **[`{reactable}`](https://glin.github.io/reactable/index.html)** and Harry Potter Kaggle Dataset

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/04-table-1.png" width="672" />

# 20220207: **[`{reactable}`](https://glin.github.io/reactable/index.html)** and Harry Potter Kaggle Dataset - Number 2

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/05-table-1.png" width="672" />

Also see,
**[`reactablefmtr`](https://github.com/kcuilla/reactablefmtr)**

# 20220208 and 20220209: #TidyTuesday and the Tuskegee Airmen

# 20220210 and 20220211: **[`ggvoronoi`](https://cran.r-project.org/web/packages/ggvoronoi/vignettes/ggvoronoi.html)**

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/ggvoronoi-plots-1.png" width="672" /><img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/ggvoronoi-plots-2.png" width="672" />

# 20220214: **[`ggvoronoi`](https://cran.r-project.org/web/packages/ggvoronoi/vignettes/ggvoronoi.html)** in a heart

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/heart-setup-1.png" width="672" />

# 20220215 and 20220216: #TidyTuesday and #DuBoisChallenge2022

I’m going to try Day 6.

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/webd-d6-1.png" width="672" />

It’ll do for the amount of time I have.

# 20220217: **[{engsoccerdata}](https://github.com/jalapic/engsoccerdata)**

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/esd-tests-1.png" width="672" />

# 20220218: More Soccer Data

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/February_2022/esd-d2-plot-1.png" width="672" />

# 20220222: More Soccer Data

# 20220223 and 20220224: More Soccer Data with {gt} (eventually)

<div id="cdmqeiwyxp" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#cdmqeiwyxp .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#cdmqeiwyxp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cdmqeiwyxp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#cdmqeiwyxp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#cdmqeiwyxp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cdmqeiwyxp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cdmqeiwyxp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#cdmqeiwyxp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#cdmqeiwyxp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cdmqeiwyxp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cdmqeiwyxp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#cdmqeiwyxp .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#cdmqeiwyxp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#cdmqeiwyxp .gt_from_md > :first-child {
  margin-top: 0;
}

#cdmqeiwyxp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cdmqeiwyxp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#cdmqeiwyxp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#cdmqeiwyxp .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#cdmqeiwyxp .gt_row_group_first td {
  border-top-width: 2px;
}

#cdmqeiwyxp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cdmqeiwyxp .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#cdmqeiwyxp .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#cdmqeiwyxp .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cdmqeiwyxp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cdmqeiwyxp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cdmqeiwyxp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cdmqeiwyxp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cdmqeiwyxp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cdmqeiwyxp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#cdmqeiwyxp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cdmqeiwyxp .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#cdmqeiwyxp .gt_left {
  text-align: left;
}

#cdmqeiwyxp .gt_center {
  text-align: center;
}

#cdmqeiwyxp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cdmqeiwyxp .gt_font_normal {
  font-weight: normal;
}

#cdmqeiwyxp .gt_font_bold {
  font-weight: bold;
}

#cdmqeiwyxp .gt_font_italic {
  font-style: italic;
}

#cdmqeiwyxp .gt_super {
  font-size: 65%;
}

#cdmqeiwyxp .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#cdmqeiwyxp .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#cdmqeiwyxp .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#cdmqeiwyxp .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#cdmqeiwyxp .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">team</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">overall_pts</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">gf</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">ga</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">gd</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">results</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">FC Dallas</td>
<td class="gt_row gt_right">60</td>
<td class="gt_row gt_right">50</td>
<td class="gt_row gt_right">40</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='6.10' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='22.82' y1='6.10' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='6.10' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Colorado Rapids</td>
<td class="gt_row gt_right">58</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">32</td>
<td class="gt_row gt_right">7</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='6.10' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='19.72' y1='1.89' x2='19.72' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='6.10' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">New York Red Bulls</td>
<td class="gt_row gt_right">57</td>
<td class="gt_row gt_right">61</td>
<td class="gt_row gt_right">44</td>
<td class="gt_row gt_right">17</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='1.89' x2='4.19' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='7.30' y1='6.10' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='6.10' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='19.72' y1='6.10' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">New York City FC</td>
<td class="gt_row gt_right">54</td>
<td class="gt_row gt_right">62</td>
<td class="gt_row gt_right">57</td>
<td class="gt_row gt_right">5</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='6.10' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Toronto FC</td>
<td class="gt_row gt_right">53</td>
<td class="gt_row gt_right">51</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='1.89' x2='4.19' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='6.10' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='19.72' y1='6.10' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='22.82' y1='6.10' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='6.10' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">LA Galaxy</td>
<td class="gt_row gt_right">52</td>
<td class="gt_row gt_right">54</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">15</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='6.10' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='6.10' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='22.82' y1='8.91' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='6.10' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Seattle Sounders</td>
<td class="gt_row gt_right">48</td>
<td class="gt_row gt_right">44</td>
<td class="gt_row gt_right">43</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='6.10' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='1.89' x2='19.72' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='6.10' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Sporting Kansas City</td>
<td class="gt_row gt_right">47</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">41</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='6.10' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='8.91' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='16.61' y1='6.10' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='19.72' y1='6.10' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='6.10' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">DC United</td>
<td class="gt_row gt_right">46</td>
<td class="gt_row gt_right">53</td>
<td class="gt_row gt_right">47</td>
<td class="gt_row gt_right">6</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='6.10' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='19.72' y1='1.89' x2='19.72' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Real Salt Lake</td>
<td class="gt_row gt_right">46</td>
<td class="gt_row gt_right">44</td>
<td class="gt_row gt_right">46</td>
<td class="gt_row gt_right">-2</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='6.10' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='6.10' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Montreal Impact</td>
<td class="gt_row gt_right">45</td>
<td class="gt_row gt_right">49</td>
<td class="gt_row gt_right">53</td>
<td class="gt_row gt_right">-4</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='6.10' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Portland Timbers</td>
<td class="gt_row gt_right">44</td>
<td class="gt_row gt_right">48</td>
<td class="gt_row gt_right">53</td>
<td class="gt_row gt_right">-5</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='8.91' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='1.89' x2='19.72' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='22.82' y1='8.91' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Philadelphia Union</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">52</td>
<td class="gt_row gt_right">55</td>
<td class="gt_row gt_right">-3</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='8.91' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='16.61' y1='6.10' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='6.10' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">New England Revolution</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">44</td>
<td class="gt_row gt_right">54</td>
<td class="gt_row gt_right">-10</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='6.10' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='1.89' x2='19.72' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='22.82' y1='8.91' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='25.92' y1='1.89' x2='25.92' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Orlando City</td>
<td class="gt_row gt_right">41</td>
<td class="gt_row gt_right">55</td>
<td class="gt_row gt_right">60</td>
<td class="gt_row gt_right">-5</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='1.89' x2='10.40' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='13.51' y1='8.91' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='6.10' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Vancouver Whitecaps</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">45</td>
<td class="gt_row gt_right">52</td>
<td class="gt_row gt_right">-7</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='6.10' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='13.51' y1='8.91' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='6.10' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='6.10' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='32.13' y1='1.89' x2='32.13' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">San Jose Earthquakes</td>
<td class="gt_row gt_right">38</td>
<td class="gt_row gt_right">32</td>
<td class="gt_row gt_right">40</td>
<td class="gt_row gt_right">-8</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='6.10' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='8.91' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='29.03' y1='6.10' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Columbus Crew</td>
<td class="gt_row gt_right">36</td>
<td class="gt_row gt_right">50</td>
<td class="gt_row gt_right">58</td>
<td class="gt_row gt_right">-8</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='1.89' x2='4.19' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='1.89' x2='22.82' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='25.92' y1='6.10' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Houston Dynamo</td>
<td class="gt_row gt_right">34</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">45</td>
<td class="gt_row gt_right">-6</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='6.10' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='7.30' y1='8.91' x2='7.30' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='10.40' y1='6.10' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='13.51' y1='1.89' x2='13.51' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='16.61' y1='1.89' x2='16.61' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='8.91' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='25.92' y1='6.10' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='29.03' y1='8.91' x2='29.03' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='32.13' y1='6.10' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /></g></svg></td></tr>
    <tr><td class="gt_row gt_left">Chicago Fire</td>
<td class="gt_row gt_right">31</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">58</td>
<td class="gt_row gt_right">-16</td>
<td class="gt_row gt_center"><?xml version='1.0' encoding='UTF-8' ?><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' class='svglite' width='58.06pt' height='10.80pt' viewBox='0 0 58.06 10.80'><defs>  <style type='text/css'><![CDATA[    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {      fill: none;      stroke: #000000;      stroke-linecap: round;      stroke-linejoin: round;      stroke-miterlimit: 10.00;    }    .svglite text {      white-space: pre;    }  ]]></style></defs><rect width='100%' height='100%' style='stroke: none; fill: none;'/><defs>  <clipPath id='cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw'>    <rect x='0.00' y='0.00' width='58.06' height='10.80' />  </clipPath></defs><g clip-path='url(#cpMC4wMHw1OC4wNnwwLjAwfDEwLjgw)'><line x1='4.19' y1='8.91' x2='4.19' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='7.30' y1='1.89' x2='7.30' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='10.40' y1='8.91' x2='10.40' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='13.51' y1='6.10' x2='13.51' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='16.61' y1='8.91' x2='16.61' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='19.72' y1='8.91' x2='19.72' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='22.82' y1='8.91' x2='22.82' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /><line x1='25.92' y1='6.10' x2='25.92' y2='4.70' style='stroke-width: 2.13; stroke: #BEBEBE;' /><line x1='29.03' y1='1.89' x2='29.03' y2='6.10' style='stroke-width: 2.13; stroke: #013369;' /><line x1='32.13' y1='8.91' x2='32.13' y2='4.70' style='stroke-width: 2.13; stroke: #D50A0A;' /></g></svg></td></tr>
  </tbody>
  
  
</table>
</div>

# Ideas

{template}, {rprojroot}, {rgbif}, {geoviz}, {ggmap}, {rayvista},
{camcorder}, {renv}, {rayvertex}, {hrbrthemes}, {firatheme}, {pwr},
voronoi, {reprex}, debug = T for geom\_text, {lcmm}, {rolldown}, {muvr},
{pcalg}, {packagemetrics}, {steveproj}, {ungeviz}, {themis}, {biscale},
{prettydoc}, {annotate}, {printy}, {roughsf}, {colorspace},
{monochromeR}, {colorblindr}, {engsoccerdata}
