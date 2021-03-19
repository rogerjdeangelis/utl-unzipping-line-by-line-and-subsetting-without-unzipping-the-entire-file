Unzipping line by line and subsetting without unzipping the entire file;

Should be usefull for very large gzipped single archive files;

Gitbub
https://tinyurl.com/p4ab6s6b
https://github.com/rogerjdeangelis/utl-unzipping-line-by-line-and-subsetting-without-unzipping-the-entire-file

Inspired by
https://tinyurl.com/4zsyh4xs
https://stackoverflow.com/questions/25330363/reading-line-by-line-the-contents-of-an-80gb-gz-file-without-uncompressing-it

 Process

   a. R: Create a gzip file. Has to be a gzip because other zip files
      have meta data at the end of the zip file

   b. Python(2.7) very small chunks of the file are read at a time.
      Print only records that contain "Audi".
      Python can build a dataframe in the look?


 *_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

* greate gzip file;

* delete files if rerunning;
%utlfkil(d:/zip/cars.gz);
%utlfkil(d:/csv/cars.csv);

* create csv file;
dm  'dexport sashelp.cars "d:/csv/cars.csv"';

* gzip
%utl_submit_r64('
  library(R.utils);
  gzip("d:/csv/cars.csv",destname="d:/zip/cars.gz",remove=FALSE);
');

/*
D:/CSV/CARS.CSV


MAKE,MODEL,TYPE,ORIGIN,DRIVETRAIN,MSRP,INVOICE,ENGINESIZE,CYLINDERS,HORSEPOWER,MPG_CITY,MPG_HIGHWAY,WEIGHT,WHEELBASE,LENGTH
Acura,MDX,SUV,Asia,All,"$36,945","$33,337",3.5,6,265,17,23,4451,106,189
Acura,RSX Type S 2dr,Sedan,Asia,Front,"$23,820","$21,761",2,4,200,24,31,2778,101,172
Acura,TSX 4dr,Sedan,Asia,Front,"$26,990","$24,647",2.4,4,200,22,29,3230,105,183
Acura,TL 4dr,Sedan,Asia,Front,"$33,195","$30,299",3.2,6,270,20,28,3575,108,186
Acura,3.5 RL 4dr,Sedan,Asia,Front,"$43,755","$39,014",3.5,6,225,18,24,3880,115,197
Acura,3.5 RL w/Navigation 4dr,Sedan,Asia,Front,"$46,100","$41,100",3.5,6,225,18,24,3893,115,197
Acura,NSX coupe 2dr manual S,Sports,Asia,Rear,"$89,765","$79,978",3.2,6,290,17,24,3153,100,174
Audi,A4 1.8T 4dr,Sedan,Europe,Front,"$25,940","$23,508",1.8,4,170,22,31,3252,104,179
Audi,A41.8T convertible 2dr,Sedan,Europe,Front,"$35,940","$32,506",1.8,4,170,23,30,3638,105,180
Audi,A4 3.0 4dr,Sedan,Europe,Front,"$31,840","$28,846",3,6,220,20,28,3462,104,179
Audi,A4 3.0 Quattro 4dr manual,Sedan,Europe,All,"$33,430","$30,366",3,6,220,17,26,3583,104,179
Audi,A4 3.0 Quattro 4dr auto,Sedan,Europe,All,"$34,480","$31,388",3,6,220,18,25,3627,104,179
Audi,A6 3.0 4dr,Sedan,Europe,Front,"$36,640","$33,129",3,6,220,20,27,3561,109,192

and

D:/ZIP/CARS.GZ

*/

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

* note this is python 2.7;

%utl_submit_py64_27("
import gzip;
import csv;
substring='BMW';
with gzip.open('d:/zip/cars.gz', 'rb') as fobj:;
.   reader = csv.reader(fobj, delimiter=',');
.   for row in reader:;
.        s = ','.join(row);
.        if 'Audi' in  s:;
.             print(s);
");

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
             _   |_|                   _
  ___  _ __ | |_   _    __ _ _   _  __| (_)
 / _ \| '_ \| | | | |  / _` | | | |/ _` | |
| (_) | | | | | |_| | | (_| | |_| | (_| | |
 \___/|_| |_|_|\__, |  \__,_|\__,_|\__,_|_|
               |___/
;
Audi,A4 1.8T 4dr,Sedan,Europe,Front,$25,940,$23,508,1.8,4,170,22,31,3252,104,179
Audi,A41.8T convertible 2dr,Sedan,Europe,Front,$35,940,$32,506,1.8,4,170,23,30,3638,105,180
Audi,A4 3.0 4dr,Sedan,Europe,Front,$31,840,$28,846,3,6,220,20,28,3462,104,179
Audi,A4 3.0 Quattro 4dr manual,Sedan,Europe,All,$33,430,$30,366,3,6,220,17,26,3583,104,179
Audi,A4 3.0 Quattro 4dr auto,Sedan,Europe,All,$34,480,$31,388,3,6,220,18,25,3627,104,179
Audi,A6 3.0 4dr,Sedan,Europe,Front,$36,640,$33,129,3,6,220,20,27,3561,109,192
Audi,A6 3.0 Quattro 4dr,Sedan,Europe,All,$39,640,$35,992,3,6,220,18,25,3880,109,192
Audi,A4 3.0 convertible 2dr,Sedan,Europe,Front,$42,490,$38,325,3,6,220,20,27,3814,105,180
Audi,A4 3.0 Quattro convertible 2dr,Sedan,Europe,All,$44,240,$40,075,3,6,220,18,25,4013,105,180
Audi,A6 2.7 Turbo Quattro 4dr,Sedan,Europe,All,$42,840,$38,840,2.7,6,250,18,25,3836,109,192
Audi,A6 4.2 Quattro 4dr,Sedan,Europe,All,$49,690,$44,936,4.2,8,300,17,24,4024,109,193
Audi,A8 L Quattro 4dr,Sedan,Europe,All,$69,190,$64,740,4.2,8,330,17,24,4399,121,204
Audi,S4 Quattro 4dr,Sedan,Europe,All,$48,040,$43,556,4.2,8,340,14,20,3825,104,179
Audi,RS 6 4dr,Sports,Europe,Front,$84,600,$76,417,4.2,8,450,15,22,4024,109,191
Audi,TT 1.8 convertible 2dr (coupe),Sports,Europe,Front,$35,940,$32,512,1.8,4,180,20,28,3131,95,159
Audi,TT 1.8 Quattro 2dr (convertible),Sports,Europe,All,$37,390,$33,891,1.8,4,225,20,28,2921,96,159
Audi,TT 3.2 coupe 2dr (convertible),Sports,Europe,All,$40,590,$36,739,3.2,6,250,21,29,3351,96,159
Audi,A6 3.0 Avant Quattro,Wagon,Europe,All,$40,840,$37,060,3,6,220,18,25,4035,109,192
Audi,S4 Avant Quattro,Wagon,Europe,All,$49,090,$44,446,4.2,8,340,15,21,3936,104,179

