CREATE SCHEMA wisdom;
CREATE TABLE wisdom.services (
                          service_id UUID PRIMARY KEY,
                          name VARCHAR UNIQUE,
                          price NUMERIC(12,2)
);

CREATE TABLE wisdom.customers (
                           customer_id UUID PRIMARY KEY,
                           first_name VARCHAR,
                           last_name VARCHAR,
                           email VARCHAR UNIQUE,
                           phone VARCHAR,
                           address VARCHAR
);

CREATE TABLE wisdom.vendors (
                         vendor_id UUID PRIMARY KEY,
                         name VARCHAR NOT NULL,
                         contact VARCHAR,
                         phone VARCHAR,
                         email VARCHAR UNIQUE,
                         address VARCHAR
);

CREATE TABLE wisdom.products (
                          product_id UUID PRIMARY KEY,
                          name VARCHAR UNIQUE,
                          price NUMERIC (12,2),
                          vendor_id UUID NOT NULL,
                          FOREIGN KEY (VENDOR_ID) references wisdom.vendors(VENDOR_ID)
);

INSERT INTO wisdom.services (service_id, name, price) VALUES (gen_random_uuid(),'Dog Vaccination Package',65.00);
INSERT INTO wisdom.services (service_id, name, price) VALUES (gen_random_uuid(),'Cat Vaccination Package',55.00);
INSERT INTO wisdom.services (service_id, name, price) VALUES (gen_random_uuid(),'Rabies 1 or 3 year Vaccination',18.00);
INSERT INTO wisdom.services (service_id,name, price) VALUES (gen_random_uuid(),'Parasite Treatment Package',75.00);
INSERT INTO wisdom.services (service_id,name, price) VALUES (gen_random_uuid(),'Microchip Service',15.00);
INSERT INTO wisdom.services (service_id,name, price) VALUES (gen_random_uuid(),'Basic Teeth Cleaning and Exam',100.00);

INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Edgepulse','Gerald Martinez','(991) 321-6632','gmartinez0@hostgator.com','900 Butternut Avenue, Albany, NY 12242');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Quaxo','Jimmy Ford','(960) 473-6813','jford2@nyu.edu','7 Sheridan Plaza, Lubbock, TX 79491');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Talane','Doris Banks','(638) 639-1027','dbanksa@discovery.com','1 Montana Trail, Seattle, WA 98133');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Chatterpoint','Elizabeth Chapman','(477) 406-4840','echapmanc@ftc.gov','29 Cody Pass, Washington, DC 20231');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Jetwire','Ralph Robinson','(169) 278-8061','rrobinsonh@uol.com.br','337 Anderson Terrace, El Paso, TX 88514');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Babbleblab','Wayne Rose','(676) 164-7258','wrosei@unc.edu','5863 Cody Alley, Fort Wayne, IN 46852');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'DabZ','Irene Peters','(192) 180-2622','ipetersn@patch.com','2 Ryan Avenue, Columbia, SC 29203');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Kazio','Samuel Hicks','(521) 554-5962','shickss@edublogs.org','128 Northview Trail, Beaverton, OR 97075');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Rooxo','Andrea Stephens','(030) 069-4355','astephens10@csmonitor.com','22 Reinke Terrace, Indianapolis, IN 46231');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Rhynyx','Raymond Long','(333) 716-1970','rlong11@japanpost.jp','3 Ridgeview Park, Arlington, VA 22217');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Jaloo','Bonnie Roberts','(748) 268-7532','broberts14@hubpages.com','7 Farmco Court, Montgomery, AL 36125');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Photolist','Raymond Stephens','(558) 050-0005','rstephens16@vkontakte.ru','45 Homewood Park, Charlotte, NC 28215');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Abata','Shawn Barnes','(959) 677-9827','sbarnes18@europa.eu','5 5th Street, Sioux Falls, SD 57110');
INSERT INTO wisdom.vendors (vendor_id, name, contact, phone, email, address) VALUES (gen_random_uuid(),'Yakitri','Roy Wood','(699) 388-0362','rwood1f@tinypic.com','4 Dakota Alley, Stockton, CA 95219');


INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Strong Joints Dog Supplement',5.87, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Rooxo'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Healthy Coat Dog Supplement',6.44, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Chatterpoint'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Probiotic Dog Treats',8.89, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Rhynyx'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Small Hypoallergenic Pet Bowl',6.55, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Abata'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Large Hypoallergenic Pet Bowl',8.14, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Abata'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Cat Hairball Remedy Gel',6.00, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Yakitri'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Probiotic Cat Treats',7.89, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Rhynyx'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Here Kitty Kitty Organic Catnip',7.75, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Kazio'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Calm Cat Anxiety Relief Spray',9.49, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Quaxo'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Medicated Dog Shampoo',8.73, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'DabZ'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Strong Joints Cat Supplement',5.53, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Edgepulse'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Healthy Coat Cat Supplement',9.56, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Photolist'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Senior Dog Vitamin Chews',9.66, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Talane'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Kidney Support Liquid Dietary Supplement',9.12, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Jaloo'));
INSERT INTO wisdom.products (product_id, name, price, vendor_id) VALUES (gen_random_uuid(),'Advance Pet Oral Care Toothbrush and Toothpaste',9.55, (SELECT vendor_id FROM wisdom.vendors WHERE name = 'Babbleblab'));

INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Cally','Reynolds','penatibus.et@lectusa.com','(901) 166-8355','556 Lakewood Park, Bismarck, ND 58505');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Sydney','Bartlett','nibh@ultricesposuere.edu','(982) 231-7357','4829 Badeau Parkway, Chattanooga, TN 37405');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Hunter','Newton','quam.quis.diam@facilisisfacilisis.org','(831) 996-1240','2 Rockefeller Avenue, Waco, TX 76796');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Brooke','Perkins','sit@vitaealiquetnec.net','(340) 732-9367','87 Brentwood Park, Dallas, TX 75358');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Nolan','Slater','sociis.natoque.penatibus@pedeCras.co.uk','(540) 487-5928','99 Sage Street, Reno, NV 89505');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Germaine','Green','ultrices.Vivamus@orciin.edu','(466) 455-4160','6 Jana Park, San Antonio, TX 78240');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Medge','Ratliff','nulla.ante@posuerevulputate.org','(358) 751-8227','75 Erie Terrace, Dayton, OH 45454');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Nash','Vasquez','ut.nisi@elitAliquam.ca','(989) 937-6199','39464 Debra Lane, Young America, MN 55557');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Michael','Rutledge','eget.lacus@sitametorci.org','(366) 822-4574','8231 Crowley Crossing, Cincinnati, OH 45999');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Guy','Ochoa','montes.nascetur@semperrutrum.net','(720) 242-4596','92483 Doe Crossing Drive, Lansing, MI 48956');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Coby','Lucas','auctor.odio@utdolordapibus.co.uk','(177) 816-3420','7316 Dryden Road, Memphis, TN 38114');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Merrill','Freeman','pellentesque@Donecest.net','(838) 734-1768','7746 Mitchell Point, New Haven, CT 6510');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Rae','Hawkins','et.magnis@posuereat.edu','(484) 158-4493','181 Packers Way, Boston, MA 2216');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Sade','Santiago','ipsum@eu.co.uk','(497) 492-4618','2 Farragut Crossing, Anchorage, AK 99512');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Judith','Leonard','Ut.tincidunt.vehicula@urnajusto.org','(549) 439-1744','2 namekagon Trail, Trenton, NJ 8619');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Malik','Faulkner','Nullam.suscipit.est@ametornare.com','(186) 520-2519','8 Gerald Point, Orlando, FL 32868');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Benjamin','Miranda','Proin.vel.nisl@enim.ca','(992) 329-4925','40 Lighthouse Bay Circle, Saint Petersburg, FL 33731');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Rhona','Stanley','metus@dictumplacerataugue.net','(237) 294-5071','992 Haas Avenue, San Diego, CA 92186');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Amena','Petersen','amet.massa@Maurisvestibulumneque.net','(383) 554-7219','6625 Lukken Circle, Brooklyn, NY 11205');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Lucas','Trevino','eros@faucibusleo.ca','(176) 773-9482','78 Summer Ridge Alley, Duluth, MN 55805');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Dorian','Dale','adipiscing.elit.Etiam@euultricessit.edu','(311) 929-6026','9843 Graceland Point, Lansing, MI 48930');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Shellie','Velez','dignissim.tempor@tincidunt.edu','(197) 282-8671','5204 Beilfuss Place, Columbus, OH 43204');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Rhonda','Wilder','sed@quispedePraesent.edu','(653) 854-3876','92 Northfield Terrace, Louisville, KY 40287');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Tyrone','Powell','Nullam.ut@tellusjusto.co.uk','(113) 724-9255','91955 Mosinee Parkway, Indianapolis, IN 46278');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Raja','Wells','arcu.eu@eusem.com','(244) 178-1821','62 Warner Place, Washington, DC 20525');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Adara','Langley','per.conubia.nostra@neque.org','(696) 810-8990','88 Burning Wood Junction, Anaheim, CA 92812');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Jerry','Gill','taciti@vehicula.edu','(491) 955-1047','229 Golden Leaf Road, Gadsden, AL 35905');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Arden','Bennett','congue.a@lorem.edu','(959) 194-1875','6502 Montana Junction, New Orleans, LA 70174');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Philip','Ware','faucibus.Morbi@semmagna.org','(615) 720-3672','58034 Nelson Street, Washington, DC 20036');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Clementine','Oliver','purus@luctus.edu','(603) 332-7827','6 Granby Drive, Topeka, KS 66606');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Iliana','Hester','mauris@consectetuerrhoncus.ca','(716) 866-7734','3409 Oriole Point, Peoria, IL 61629');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Francesca','Hodges','tempor.arcu.Vestibulum@tinciduntaliquamarcu.com','(324) 686-7614','609 Everett Avenue, Des Moines, IA 50330');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Sydney','Robertson','tempor.arcu@ascelerisque.com','(304) 577-5758','3061 Sachs Lane, Scottsdale, AZ 85255');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Amery','Washington','Suspendisse.commodo@egestasrhoncus.ca','(191) 476-0002','710 Old Gate Circle, Chicago, IL 60641');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Barrett','Howell','ultricies.ornare.elit@Mauris.ca','(538) 115-5665','0864 Bluestem Center, Sacramento, CA 95823');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Lunea','Rios','nisl.Maecenas.malesuada@nuncac.org','(311) 982-5690','289 Porter Crossing, Silver Spring, MD 20918');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Wynter','Roberts','ac@Utsemper.net','(721) 262-6519','89318 Heffernan Crossing, Santa Barbara, CA 93150');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Melyssa','Gates','ipsum.cursus.vestibulum@semperegestas.com','(263) 976-2589','419 Tennyson Court, San Luis Obispo, CA 93407');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Quail','Vance','Mauris@Proin.co.uk','(229) 484-5107','25 Green Plaza, Davenport, IA 52804');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Rose','Holcomb','sagittis.placerat.Cras@pharetra.edu','(129) 823-5800','6755 Burrows Center, Columbus, GA 31914');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Ayanna','Foreman','molestie@mattis.edu','(146) 146-9356','30 Gulseth Junction, San Francisco, CA 94154');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Jael','Rice','at.auctor@nonvestibulumnec.net','(394) 444-6027','68316 Emmet Trail, San Diego, CA 92153');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Anastasia','Owens','egestas.a@sapien.edu','(423) 401-3016','86432 Westridge Alley, Wichita, KS 67230');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Zephr','Mcgee','nec@orci.ca','(708) 764-4578','2 Nevada Junction, Pittsburgh, PA 15235');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Roth','Black','luctus@nec.co.uk','(330) 983-4433','605 Bunting Road, White Plains, NY 10606');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Calvin','Henry','blandit@quis.com','(327) 821-0113','52 Sachtjen Avenue, Tampa, FL 33661');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Joshua','Delaney','Proin@vitaeerat.co.uk','(838) 282-2276','62 Karstens Junction, Tulsa, OK 74141');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Laith','Jordan','ligula.tortor@Curabituregestas.co.uk','(868) 659-6715','7468 Talmadge Junction, Baltimore, MD 21275');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Blaine','Ashley','amet.consectetuer.adipiscing@vestibulum.com','(261) 759-5806','561 Basil Court, Greensboro, NC 27404');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Mollie','Meyers','eu.odio@tempor.edu','(309) 329-9140','4276 Hallows Terrace, San Antonio, TX 78260');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Oleg','Merritt','Vestibulum.ante.ipsum@sapienimperdiet.edu','(513) 912-4721','874 Leroy Hill, Santa Rosa, CA 95405');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Zephr','Fry','a@nibhdolor.com','(166) 472-2547','6 Manitowish Trail, Topeka, KS 66642');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Nolan','Robertson','neque.sed@turpis.ca','(822) 296-4465','8698 Crest Line Parkway, Columbia, SC 29208');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Astra','Edwards','Aliquam.fringilla.cursus@necmalesuada.org','(177) 600-1729','5733 Walton Center, Jamaica, NY 11470');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Adena','Jenkins','in@dictum.org','(342) 731-9079','22577 Starling Lane, Chicago, IL 60604');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Sasha','King','ac.mattis@pretiumaliquet.net','(733) 104-5058','86073 Sloan Way, Pueblo, CO 81015');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Kenneth','Potts','nec.ante@Donecnibhenim.edu','(976) 544-1168','1 Springview Circle, Helena, MT 59623');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Roanna','Acevedo','sit@ac.org','(868) 464-7466','7 Cottonwood Plaza, Pensacola, FL 32505');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Debra','Finley','arcu@nisiMaurisnulla.co.uk','(542) 954-1230','3627 Pine View Circle, Cleveland, OH 44118');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Shay','Davidson','tempus.scelerisque@turpisnonenim.co.uk','(934) 777-4129','423 Kenwood Park, Temple, TX 76505');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Kyla','Hebert','vitae.nibh.Donec@ideratEtiam.org','(715) 654-8147','4 Manufacturers Pass, Greensboro, NC 27499');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Josiah','Wagner','orci.luctus@semut.org','(700) 742-7671','58 Melvin Pass, Huntsville, AL 35815');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Hadley','Sosa','convallis.convallis.dolor@aenim.co.uk','(222) 150-9436','95567 Browning Crossing, Vero Beach, FL 32964');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Karly','Hardin','ipsum.Suspendisse@euerosNam.ca','(106) 281-7513','9776 Beilfuss Parkway, Cleveland, OH 44118');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Molly','Grant','mauris.erat@cursusdiamat.net','(689) 843-0460','791 Cherokee Court, Merrifield, VA 22119');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Jaime','Craig','rhoncus@facilisis.co.uk','(375) 915-2089','7189 Pankratz Point, Dayton, OH 45454');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Wesley','Rush','massa.Mauris.vestibulum@In.co.uk','(722) 576-0563','24812 Cordelia Trail, Corpus Christi, TX 78475');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Dustin','Daugherty','neque.sed@ultriciessemmagna.ca','(951) 720-1227','207 Bunting Street, Sioux City, IA 51105');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Kyle','Keith','arcu.Morbi@ut.co.uk','(578) 125-5684','795 Troy Terrace, Atlanta, GA 31106');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Chester','Best','felis@eros.net','(608) 587-5791','102 Fallview Terrace, Minneapolis, MN 55441');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Kaden','Sharpe','a@Incondimentum.org','(246) 987-2818','99 Hanson Way, Richmond, VA 23242');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Shafira','Bennett','nascetur@sitametmetus.org','(279) 911-0843','9 Roth Place, Dayton, OH 45454');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Zena','Washington','risus@ProindolorNulla.edu','(921) 805-5150','823 Glacier Hill Point, San Bernardino, CA 92415');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Eric','Donaldson','ante.ipsum.primis@gravidasagittis.com','(714) 520-4254','62597 Lighthouse Bay Drive, Port Charlotte, FL 33954');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Indira','Odom','Etiam@nisi.ca','(714) 947-5101','2 Hovde Plaza, Saint Paul, MN 55108');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Savannah','Conner','Morbi.sit@pedemalesuada.net','(361) 128-7285','52509 Almo Lane, Raleigh, NC 27658');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Graham','Frederick','risus.at@orci.co.uk','(707) 474-5854','22 Superior Way, Boston, MA 2203');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Chastity','Charles','in.felis@Mauriseu.co.uk','(186) 176-2590','22278 Waubesa Road, Birmingham, AL 35225');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Leslie','Pace','Vivamus.nisi@risus.com','(623) 686-1821','839 Pepper Wood Street, El Paso, TX 88563');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Nasim','Sheppard','ut@ultricessit.co.uk','(930) 295-6752','5 Melvin Street, New York City, NY 10039');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Yoko','Travis','scelerisque.neque.sed@atlacus.net','(818) 864-3843','3149 Kinsman Court, Winston Salem, NC 27116');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Brody','Love','et.malesuada@consequat.net','(360) 338-4848','96 Eliot Way, Fresno, CA 93715');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Mona','Matthews','Donec.nibh.enim@pede.co.uk','(723) 808-1834','32174 Ridge Oak Plaza, San Francisco, CA 94177');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Jenna','Hendricks','purus.Nullam.scelerisque@ligula.net','(840) 746-9696','33837 Independence Place, Oklahoma City, OK 73124');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Sydney','Dejesus','mattis.velit@vel.net','(110) 771-1999','3 Morning Circle, San Francisco, CA 94177');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Hedy','Vang','cursus.et.eros@loremfringilla.ca','(383) 134-3234','1876 Petterle Court, Brea, CA 92822');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Gray','Gutierrez','ullamcorper@tempusrisus.edu','(496) 849-2265','7271 Ramsey Way, Washington, DC 20420');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Cailin','Alford','gravida.sit@miAliquam.net','(368) 400-8301','282 Acker Terrace, Winston Salem, NC 27157');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Erasmus','Neal','dolor@perconubia.edu','(774) 548-5638','907 Briar Crest Terrace, Santa Barbara, CA 93150');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Derek','Conrad','arcu@elit.ca','(275) 477-2907','6 Carioca Crossing, Arvada, CO 80005');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Melinda','price','fringilla@Nulla.net','(748) 701-8010','318 Park Meadow Hill, San Antonio, TX 78285');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Rebekah','Nelson','pretium.et@egestaslacinia.ca','(447) 121-6473','8117 Straubel Plaza, Jamaica, NY 11480');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Ronan','Mendez','risus@feugiatnonlobortis.co.uk','(302) 847-0643','3849 Northport Parkway, Appleton, WI 54915');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Brock','Case','magna.Phasellus@Phasellus.net','(544) 534-1984','602 Sommers Parkway, Norfolk, VA 23520');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Theodore','Brock','feugiat@Aliquameratvolutpat.edu','(662) 476-0315','400 Summit Lane, Brooklyn, NY 11210');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Serena','Malone','dictum@Fuscefermentumfermentum.edu','(137) 440-1643','30 Onsgard Crossing, Los Angeles, CA 90040');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Eagan','Bray','Vestibulum.ante@sitametmassa.net','(529) 738-3373','55617 Straubel Drive, Philadelphia, PA 19146');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Nicole','Mcconnell','enim.Mauris.quis@Vivamusnibh.net','(892) 616-0264','8 Delaware Hill, Garden Grove, CA 92844');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Kamal','Newton','turpis@loremvehicula.com','(704) 685-9968','718 Lakewood Parkway, Appleton, WI 54915');
INSERT INTO wisdom.customers (customer_id, first_name, last_name, email, phone, address) VALUES(gen_random_uuid(),'Quentin','Marshall','velit@Pellentesquehabitantmorbi.org','(203) 755-9348','100 Bunting Drive, Washington, DC 20557');