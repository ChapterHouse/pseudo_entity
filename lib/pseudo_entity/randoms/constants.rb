module PseudoEntity::Randoms::Constants

  FEMALE_FIRST_NAMES = %w{
    Abigail    Alexandra  Alison     Amanda     Amelia     Amy        Andrea     Angela     Anna       Anne       Audrey
    Ava        Bella      Bernadette Carol      Caroline   Carolyn    Chloe      Claire     Deirdre    Diana      Diane
    Donna      Dorothy    Elizabeth  Ella       Emily      Emma       Faith      Felicity   Fiona      Gabrielle  Grace
    Hannah     Heather    Irene      Jan        Jane       Jasmine    Jennifer   Jessica    Joan       Joanne     Julia
    Karen      Katherine  Kimberly   Kylie      Lauren     Leah       Lillian    Lily       Lisa       Madeleine  Maria
    Mary       Megan      Melanie    Michelle   Molly      Natalie    Nicola     Olivia     Penelope   Pippa      Rachel
    Rebecca    Rose       Ruth       Sally      Samantha   Sarah      Sonia      Sophie     Stephanie  Sue        Theresa
    Tracey     Una        Vanessa    Victoria   Virginia   Wanda      Wendy      Yvonne     Zoe
  }

  MALE_FIRST_NAMES = %w{
    Adam        Adrian      Alan        Alexander   Andrew      Anthony     Austin      Benjamin    Blake       Boris
    Brandon     Brian       Cameron     Carl        Charles     Christian   Christopher Colin       Connor      Dan
    David       Dominic     Dylan       Edward      Eric        Evan        Frank       Gavin       Gordon      Harry
    Ian         Isaac       Jack        Jacob       Jake        James       Jason       Joe         John        Jonathan
    Joseph      Joshua      Julian      Justin      Keith       Kevin       Leonard     Liam        Lucas       Luke
    Matt        Max         Michael     Nathan      Neil        Nicholas    Oliver      Owen        Paul        Peter
    Phil        Piers       Richard     Robert      Ryan        Sam         Sean        Sebastian   Simon       Stephen
    Steven      Stewart     Thomas      Tim         Trevor      Victor      Warren      William
  }

  TOP_SURNAMES = %w{
    Abraham    Allan      Alsop      Anderson   Arnold     Avery      Bailey     Baker      Ball       Bell       Berry
    Black      Blake      Bond       Bower      Brown      Buckland   Burgess    Butler     Cameron    Campbell   Carr
    Chapman    Churchill  Clark      Clarkson   Coleman    Cornish    Davidson   Davies     Dickens    Dowd       Duncan
    Dyer       Edmunds    Ellison    Ferguson   Fisher     Forsyth    Fraser     Gibson     Gill       Glover     Graham
    Grant      Gray       Greene     Hamilton   Hardacre   Harris     Hart       Hemmings   Henderson  Hill       Hodges
    Howard     Hudson     Hughes     Hunter     Ince       Jackson    James      Johnston   Jones      Kelly      Kerr
    King       Knox       Lambert    Langdon    Lawrence   Lee        Lewis      Lyman      MacDonald  MacLeod    Mackay
    Mackenzie  Manning    Marshall   Martin     Mathis     May        McDonald   McGrath    McLean     Metcalfe   Miller
    Mills      Mitchell   Morgan     Morrison   Murray     Nash       Newman     Nolan      North      Ogden      Oliver
    Paige      Parr       Parsons    Paterson   Payne      Peake      Peters     Piper      Poole      Powell     Pullman
    Quinn      Rampling   Randall    Rees       Reid       Roberts    Robertson  Ross       Russell    Rutherford Sanderson
    Scott      Sharp      Short      Simpson    Skinner    Slater     Smith      Springer   Stewart    Sutherland Taylor
    Terry      Thomson    Tucker     Turner     Underwood  Vance      Vaughan    Walker     Wallace    Walsh      Watson
    Welch      White      Wilkins    Wilson     Wright     Young
  }

  SURNAMES = %w{
    Abbott      Abraham     Acevedo     Acosta      Adams       Adkins      Aguilar     Aguirre     Albert      Alexander
    Alford      Allan       Allen       Allison     Alsop       Alston      Alvarado    Alvarez     Anderson    Andrews
    Anthony     Armstrong   Arnold      Ashley      Atkins      Atkinson    Austin      Avery       Avila       Ayala
    Ayers       Bailey      Baird       Baker       Baldwin     Ball        Ballard     Banks       Barber      Barker
    Barlow      Barnes      Barnett     Barr        Barrera     Barrett     Barron      Barry       Bartlett    Barton
    Bass        Bates       Battle      Bauer       Baxter      Beach       Bean        Beard       Beasley     Beck
    Becker      Bell        Bender      Benjamin    Bennett     Benson      Bentley     Benton      Berg        Berger
    Bernard     Berry       Best        Bird        Bishop      Black       Blackburn   Blackwell   Blair       Blake
    Blanchard   Blankenship Blevins     Bolton      Bond        Bonner      Booker      Boone       Booth       Bowen
    Bower       Bowers      Bowman      Boyd        Boyer       Boyle       Bradford    Bradley     Bradshaw    Brady
    Branch      Bray        Brennan     Brewer      Bridges     Briggs      Bright      Britt       Brock       Brooks
    Brown       Browning    Bruce       Bryan       Bryant      Buchanan    Buck        Buckland    Buckley     Buckner
    Bullock     Burch       Burgess     Burke       Burks       Burnett     Burns       Burris      Burt        Burton
    Bush        Butler      Byers       Byrd        Cabrera     Cain        Calderon    Caldwell    Calhoun     Callahan
    Camacho     Cameron     Campbell    Campos      Cannon      Cantrell    Cantu       Cardenas    Carey       Carlson
    Carney      Carpenter   Carr        Carrillo    Carroll     Carson      Carter      Carver      Case        Casey
    Cash        Castaneda   Castillo    Castro      Cervantes   Chambers    Chan        Chandler    Chaney      Chang
    Chapman     Charles     Chase       Chavez      Chen        Cherry      Christensen Christian   Church      Churchill
    Clark       Clarke      Clarkson    Clay        Clayton     Clements    Clemons     Cleveland   Cline       Cobb
    Cochran     Coffey      Cohen       Cole        Coleman     Collier     Collins     Colon       Combs       Compton
    Conley      Conner      Conrad      Contreras   Conway      Cook        Cooke       Cooley      Cooper      Copeland
    Cornish     Cortez      Cote        Cotton      Cox         Craft       Craig       Crane       Crawford    Crosby
    Cross       Cruz        Cummings    Cunningham  Curry       Curtis      Dale        Dalton      Daniel      Daniels
    Daugherty   Davenport   David       Davidson    Davies      Davis       Dawson      Day         Dean        Decker
    Dejesus     Delacruz    Delaney     Deleon      Delgado     Dennis      Diaz        Dickens     Dickerson   Dickson
    Dillard     Dillon      Dixon       Dodson      Dominguez   Donaldson   Donovan     Dorsey      Dotson      Douglas
    Dowd        Downs       Doyle       Drake       Dudley      Duffy       Duke        Duncan      Dunlap      Dunn
    Duran       Durham      Dyer        Eaton       Edmunds     Edwards     Elliott     Ellis       Ellison     Emerson
    England     English     Erickson    Espinoza    Estes       Estrada     Evans       Everett     Ewing       Farley
    Farmer      Farrell     Faulkner    Ferguson    Fernandez   Ferrell     Fields      Figueroa    Finch       Finley
    Fischer     Fisher      Fitzgerald  Fitzpatrick Fleming     Fletcher    Flores      Flowers     Floyd       Flynn
    Foley       Forbes      Ford        Foreman     Forsyth     Foster      Fowler      Fox         Francis     Franco
    Frank       Franklin    Franks      Fraser      Frazier     Frederick   Freeman     French      Frost       Fry
    Frye        Fuentes     Fuller      Fulton      Gaines      Gallagher   Gallegos    Galloway    Gamble      Garcia
    Gardner     Garner      Garrett     Garrison    Garza       Gates       Gay         Gentry      George      Gibbs
    Gibson      Gilbert     Giles       Gill        Gillespie   Gilliam     Gilmore     Glass       Glenn       Glover
    Goff        Golden      Gomez       Gonzales    Gonzalez    Good        Goodman     Goodwin     Gordon      Gould
    Graham      Grant       Graves      Gray        Green       Greene      Greer       Gregory     Griffin     Griffith
    Grimes      Gross       Guerra      Guerrero    Guthrie     Gutierrez   Guy         Guzman      Hahn        Hale
    Haley       Hall        Hamilton    Hammond     Hampton     Hancock     Haney       Hansen      Hanson      Hardacre
    Hardin      Harding     Hardy       Harmon      Harper      Harrell     Harrington  Harris      Harrison    Hart
    Hartman     Harvey      Hatfield    Hawkins     Hayden      Hayes       Haynes      Hays        Head        Heath
    Hebert      Hemmings    Henderson   Hendricks   Hendrix     Henry       Hensley     Henson      Herman      Hernandez
    Herrera     Herring     Hess        Hester      Hewitt      Hickman     Hicks       Higgins     Hill        Hines
    Hinton      Hobbs       Hodge       Hodges      Hoffman     Hogan       Holcomb     Holden      Holder      Holland
    Holloway    Holman      Holmes      Holt        Hood        Hooper      Hoover      Hopkins     Hopper      Horn
    Horne       Horton      House       Houston     Howard      Howe        Howell      Hubbard     Huber       Hudson
    Huff        Huffman     Hughes      Hull        Humphrey    Hunt        Hunter      Hurley      Hurst       Hutchinson
    Hyde        Ince        Ingram      Irwin       Jackson     Jacobs      Jacobson    James       Jarvis      Jefferson
    Jenkins     Jennings    Jensen      Jimenez     Johns       Johnson     Johnston    Jones       Jordan      Joseph
    Joyce       Joyner      Juarez      Justice     Kane        Kaufman     Keith       Keller      Kelley      Kelly
    Kemp        Kennedy     Kent        Kerr        Key         Kidd        Kim         King        Kinney      Kirby
    Kirk        Kirkland    Klein       Kline       Knapp       Knight      Knowles     Knox        Koch        Kramer
    Lamb        Lambert     Lancaster   Landry      Lane        Lang        Langdon     Langley     Lara        Larsen
    Larson      Lawrence    Lawson      Le          Leach       Leblanc     Lee         Leon        Leonard     Lester
    Levine      Levy        Lewis       Lindsay     Lindsey     Little      Livingston  Lloyd       Logan       Long
    Lopez       Lott        Love        Lowe        Lowery      Lucas       Luna        Lyman       Lynch       Lynn
    Lyons       MacDonald   MacLeod     Macdonald   Macias      Mack        Mackay      Mackenzie   Madden      Maddox
    Maldonado   Malone      Mann        Manning     Marks       Marquez     Marsh       Marshall    Martin      Martinez
    Mason       Massey      Mathews     Mathis      Matthews    Maxwell     May         Mayer       Maynard     Mayo
    Mays        McDonald    McGrath     McLean      Mcbride     Mccall      Mccarthy    Mccarty     Mcclain     Mcclure
    Mcconnell   Mccormick   Mccoy       Mccray      Mccullough  Mcdaniel    Mcdonald    Mcdowell    Mcfadden    Mcfarland
    Mcgee       Mcgowan     Mcguire     Mcintosh    Mcintyre    Mckay       Mckee       Mckenzie    Mckinney    Mcknight
    Mclaughlin  Mclean      Mcleod      Mcmahon     Mcmillan    Mcneil      Mcpherson   Meadows     Medina      Mejia
    Melendez    Melton      Mendez      Mendoza     Mercado     Mercer      Merrill     Merritt     Metcalfe    Meyer
    Meyers      Michael     Middleton   Miles       Miller      Mills       Miranda     Mitchell    Molina      Monroe
    Montgomery  Montoya     Moody       Moon        Mooney      Moore       Morales     Moran       Moreno      Morgan
    Morin       Morris      Morrison    Morrow      Morse       Morton      Moses       Mosley      Moss        Mueller
    Mullen      Mullins     Munoz       Murphy      Murray      Myers       Nash        Navarro     Neal        Nelson
    Newman      Newton      Nguyen      Nichols     Nicholson   Nielsen     Nieves      Nixon       Noble       Noel
    Nolan       Norman      Norris      North       Norton      Nunez       Obrien      Ochoa       Oconnor     Odom
    Odonnell    Ogden       Oliver      Olsen       Olson       Oneal       Oneil       Oneill      Orr         Ortega
    Ortiz       Osborn      Osborne     Owen        Owens       Pace        Pacheco     Padilla     Page        Paige
    Palmer      Park        Parker      Parks       Parr        Parrish     Parsons     Pate        Patel       Paterson
    Patrick     Patterson   Patton      Paul        Payne       Peake       Pearson     Peck        Pena        Pennington
    Perez       Perkins     Perry       Peters      Petersen    Peterson    Petty       Phelps      Phillips    Pickett
    Pierce      Piper       Pittman     Pitts       Pollard     Poole       Pope        Porter      Potter      Potts
    Powell      Powers      Pratt       Preston     Price       Prince      Pruitt      Puckett     Pugh        Pullman
    Quinn       Ramirez     Ramos       Rampling    Ramsey      Randall     Randolph    Rasmussen   Ratliff     Ray
    Raymond     Reed        Rees        Reese       Reeves      Reid        Reilly      Reyes       Reynolds    Rhodes
    Rice        Rich        Richard     Richards    Richardson  Richmond    Riddle      Riggs       Riley       Rios
    Rivas       Rivera      Rivers      Roach       Robbins     Roberson    Roberts     Robertson   Robinson    Robles
    Rocha       Rodgers     Rodriguez   Rodriquez   Rogers      Rojas       Rollins     Roman       Romero      Rosa
    Rosales     Rosario     Rose        Ross        Roth        Rowe        Rowland     Roy         Ruiz        Rush
    Russell     Russo       Rutherford  Rutledge    Ryan        Salas       Salazar     Salinas     Sampson     Sanchez
    Sanders     Sanderson   Sandoval    Sanford     Santana     Santiago    Santos      Sargent     Saunders    Savage
    Sawyer      Schmidt     Schneider   Schroeder   Schultz     Schwartz    Scott       Sears       Sellers     Serrano
    Sexton      Shaffer     Shannon     Sharp       Sharpe      Shaw        Shelton     Shepard     Shepherd    Sheppard
    Sherman     Shields     Short       Silva       Simmons     Simon       Simpson     Sims        Singleton   Skinner
    Slater      Sloan       Small       Smith       Snider      Snow        Snyder      Solis       Solomon     Sosa
    Soto        Sparks      Spears      Spence      Spencer     Springer    Stafford    Stanley     Stanton     Stark
    Steele      Stein       Stephens    Stephenson  Stevens     Stevenson   Stewart     Stokes      Stone       Stout
    Strickland  Strong      Stuart      Suarez      Sullivan    Summers     Sutherland  Sutton      Swanson     Sweeney
    Sweet       Sykes       Talley      Tanner      Tate        Taylor      Terrell     Terry       Thomas      Thompson
    Thomson     Thornton    Tillman     Todd        Torres      Townsend    Tran        Travis      Trevino     Trujillo
    Tucker      Turner      Tyler       Tyson       Underwood   Valdez      Valencia    Valentine   Valenzuela  Vance
    Vang        Vargas      Vasquez     Vaughan     Vaughn      Vazquez     Vega        Velasquez   Velazquez   Velez
    Villarreal  Vincent     Vinson      Wade        Wagner      Walker      Wall        Wallace     Waller      Walls
    Walsh       Walter      Walters     Walton      Ward        Ware        Warner      Warren      Washington  Waters
    Watkins     Watson      Watts       Weaver      Webb        Weber       Webster     Weeks       Weiss       Welch
    Wells       West        Wheeler     Whitaker    White       Whitehead   Whitfield   Whitley     Whitney     Wiggins
    Wilcox      Wilder      Wiley       Wilkerson   Wilkins     Wilkinson   William     Williams    Williamson  Willis
    Wilson      Winters     Wise        Witt        Wolf        Wolfe       Wong        Wood        Woodard     Woods
    Woodward    Wooten      Workman     Wright      Wyatt       Wynn        Yang        Yates       York        Young
    Zamora      Zimmerman
  }

  STREET_NAMES=[
      'Main Street',         'Church Street',       'Main Street North',   'High Street',         'Main Street South',
      'Elm Street',          'Washington Street',   'Chestnut Street',     'Main Street West',    '2nd Street',
      'Main Street East',    'Walnut Street',       'Maple Street',        'Broad Street',        'Park Avenue',
      'Center Street',       'Maple Avenue',        'South Street',        'Water Street',        'Pine Street',
      'Market Street',       'Oak Street',          'North Street',        'Union Street',        'School Street',
      '3rd Street',          'Spring Street',       'Court Street',        'River Road',          'Park Street',
      'Prospect Street',     'Front Street',        'Washington Avenue',   'Cedar Street',        'Cherry Street',
      'Central Avenue',      'Franklin Street',     '1st Street',          'Jefferson Street',    'West Street',
      '4th Street',          'Bridge Street',       'Highland Avenue',     'Spruce Street',       'Pleasant Street',
      'Jackson Street',      'Mill Street',         'Ridge Road',          'State Street',        'Adams Street',
      'East Street',         'Locust Street',       '5th Street',          'Academy Street',      'Elizabeth Street',
      'Hill Street',         'Madison Street',      'Pearl Street',        'Pennsylvania Avenue', 'Dogwood Drive',
      'Green Street',        'Madison Avenue',      'Vine Street',         'Church Road',         'Lincoln Avenue',
      'Lincoln Street',      'Route 1',             '11th Street',         '4th Street West',     'Grove Street',
      'Jefferson Avenue',    'Liberty Street',      'Park Place',          'River Street',        'Route 30',
      '12th Street',         '2nd Avenue',          '3rd Street West',     'Broadway',            'Hillside Avenue',
      'Meadow Lane',         'Railroad Street',     'Winding Way',         '10th Street',         '5th Avenue',
      '6th Street',          'Cherry Lane',         'Delaware Avenue',     'Monroe Street',       'New Street',
      'Route 6',             '7th Street',          '9th Street',          'Hickory Lane',        '1st Avenue',
      '2nd Street West',     'Beech Street',        'Colonial Drive',      'Summit Avenue',       'Sunset Drive',
      'Valley Road',         'Virginia Avenue',     'Williams Street',     'Willow Street',       'Woodland Drive',
      '13th Street',         '3rd Avenue',          '7th Avenue',          'Arch Street',         'Charles Street',
      'Clinton Street',      'Heather Lane',        'Holly Drive',         'Lake Street',         'Laurel Lane',
      'Mill Road',           'Mulberry Street',     'Oak Lane',            'Railroad Avenue',     'Route 32',
      '5th Street North',    'Brookside Drive',     'Canal Street',        'Canterbury Court',    'Creek Road',
      'Division Street',     'Fairway Drive',       'Hamilton Street',     'Highland Drive',      'Myrtle Avenue',
      'Poplar Street',       'Riverside Drive',     'Smith Street',        'Valley View Drive',   '4th Avenue',
      '4th Street North',    '5th Street West',     '8th Street',          'Bank Street',         'Buckingham Drive',
      'Cambridge Court',     'College Street',      'Colonial Avenue',     'Dogwood Lane',        'Durham Road',
      'Fairview Avenue',     'Franklin Avenue',     'Front Street North',  'Garden Street',       'Harrison Street',
      'James Street',        'John Street',         'King Street',         'Laurel Street',       'Olive Street',
      'Primrose Lane',       'Prospect Avenue',     'Ridge Avenue',        'Route 10',            'Route 11',
      'Route 29',            '6th Street North',    '6th Street West',     'Aspen Court',         'Atlantic Avenue',
      'Beechwood Drive',     'Cedar Avenue',        'Cedar Lane',          'Church Street North', 'Circle Drive',
      'Cottage Street',      'Creekside Drive',     'Devon Road',          'Elm Avenue',          'Forest Drive',
      'Franklin Court',      'Garfield Avenue',     'George Street',       'Glenwood Avenue',     'Henry Street',
      'Lafayette Avenue',    'Lafayette Street',    'Lakeview Drive',      'Lilac Lane',          'Oak Avenue',
      'Orange Street',       'Penn Street',         'Route 4',             'Route 70',            'Surrey Lane',
      'Taylor Street',       'Warren Street',       'Woodland Avenue',     'York Road',           '2nd Street East',
      '5th Street South',    '6th Avenue',          'Belmont Avenue',      'Chapel Street',       'Chestnut Avenue',
      'Crescent Street',     'Cypress Court',       'Deerfield Drive',     'Devonshire Drive',    'Essex Court',
      'Front Street South',  'Hillside Drive',      'Laurel Drive',        'Locust Lane',         'Magnolia Drive',
      'Orchard Street',      'Oxford Court',        'Park Drive',          'Route 20',            'Route 41',
      'Route 7',             'Tanglewood Drive',    'Walnut Avenue',       'Windsor Drive',       '3rd Street East',
      'Carriage Drive',      'Cedar Court',         'Cobblestone Court',   'College Avenue',      'Edgewood Drive',
      'Elmwood Avenue',      'Fawn Lane',           'Fieldstone Drive',    'Grant Avenue',        'Grant Street',
      'Grove Avenue',        'Hawthorne Lane',      'Heritage Drive',      'Hillcrest Avenue',    'Hilltop Road',
      'Jefferson Court',     'Linden Street',       'Maple Lane',          'Mechanic Street',     'Rose Street',
      'Route 100',           'Route 202',           'Route 44',            'Route 9',             'Street Road',
      'Summit Street',       'Sycamore Drive',      'Valley Drive',        'Wall Street',         'Windsor Court',
      'York Street',         '12th Street East',    '2nd Street North',    '3rd Street North',    '8th Avenue',
      '8th Street South',    'Berkshire Drive',     'Briarwood Drive',     'Bridle Lane',         'Buttonwood Drive',
      'Cardinal Drive',      'Catherine Street',    'Cemetery Road',       'Clark Street',        'Clay Street',
      'Columbia Street',     'Cooper Street',       'Depot Street',        'Durham Court',        'Eagle Road',
      'Forest Street',       'Fulton Street',       'Grand Avenue',        'Harrison Avenue',     'Hickory Street',
      'Howard Street',       'Inverness Drive',     'Ivy Court',           'Jackson Avenue',      'Lake Avenue',
      'Lantern Lane',        'Madison Court',       'Magnolia Avenue',     'Magnolia Court',      'Meadow Street',
      'Mulberry Court',      'Mulberry Lane',       'Pheasant Run',        'Pin Oak Drive',       'Queen Street',
      'Race Street',         'Redwood Drive',       'Route 17',            'Sheffield Drive',     'Sherman Street',
      'Sherwood Drive',      'Strawberry Lane',     'Sunset Avenue',       'Sycamore Lane',       'Warren Avenue',
      'Westminster Drive',   'William Street',      'Wood Street',         'Woodland Road',       '14th Street',
      '19th Street',         '5th Street East',     '8th Street West',     'Amherst Street',      'Andover Court',
      'Ann Street',          'Arlington Avenue',    'Ashley Court',        'Aspen Drive',         'Augusta Drive',
      'B Street',            'Brook Lane',          'Brown Street',        'Cambridge Road',      'Canterbury Drive',
      'Canterbury Road',     'Cleveland Street',    'Country Club Drive',  'Country Club Road',   'Country Lane',
      'Cross Street',        'Devon Court',         'Eagle Street',        'Euclid Avenue',       'Evergreen Lane',
      'Fairview Road',       'Glenwood Drive',      'Heather Court',       'Hillcrest Drive',     'Holly Court',
      'Hudson Street',       'Ivy Lane',            'Jones Street',        'Lawrence Street',     'Lexington Court',
      'Linda Lane',          'Maiden Lane',         'Morris Street',       'Myrtle Street',       'Old York Road',
      'Orchard Avenue',      'Oxford Road',         'Ridge Street',        'Roberts Road',        'Rosewood Drive',
      'Route 2',             'Route 27',            'Route 5',             'Route 64',            'Schoolhouse Lane',
      'Spruce Avenue',       'Summer Street',       'Sycamore Street',     'Taylor Avenue',       'Valley View Road',
      'Victoria Court',      'West Avenue',         'Willow Drive'
  ]

  STREET_POSITIONS = %W{
    NW  N NE
     W #{} E
    SW  S SE
  }

  CITIES = %w{
    Arlington   Ashland     Auburn      Burlington
    Centerville Clayton     Cleveland   Clinton
    Dayton      Dover       Fairview    Franklin
    Georgetown  Greenville  Hudson      Jackson
    Kingston    Lexington   Madison     Manchester
    Marion      Milford     Milton      Mount
    Newport     Oakland     Oxford      Riverside
    Salem       Springfield Washington  Winchester
  }

  STATES = %w{
    AK AL AR AZ CA CO CT DC
    DE FL GA HI IA ID IL IN
    KS KY LA MA MD ME MI MN
    MO MS MT NC ND NE NH NJ
    NM NV NY OH OK OR PA RI
    SC SD TN TX UT VA VT WA
    WI WV WY
  }

  REGIONS = [
      'Northern', 'Northwestern', 'North Central', 'Northeastern',
      'Southern', 'Southwestern', 'South Central', 'Southeastern',
      'Western', 'West Central',
      'Eastern', 'East Central',
      'Central'
  ]

  CREDIT_CARDS = [
      ['American Express',           '378282246310005'],  ['American Express', '371449635398431'],
      ['American Express Corporate', '378734493671000'],
      ['Australian BankCard',        '5610591081018250'],
      ['Diners Club',                '30569309025904'],   ['Diners Club',      '38520000023237'],
      ['Discover',                   '6011111111111117'], ['Discover',         '6011000990139424'],
      ['JCB',                        '3530111333300000'], ['JCB',              '3566002020360505'],
      ['MasterCard',                 '5555555555554444'], ['MasterCard',       '5105105105105100'],
      ['Visa',                       '4111111111111111'], ['Visa',             '4012888888881881'],  ['Visa', '4222222222222']
  ]

  BANK_PREFIXES = %w{ American Citizens Community County Farmers First Merchants Peoples Security Valley }
  CREDIT_UNION_PREFIXES = %w{ Community Employees County First Valley Teachers Financial City Area United }

  DOMAINS = %w{ com net org }
  COMPANY_TYPES = %w{ Co. Inc. Corp. Ltd. }

  SLOGAN_PATTERNS = [
    'The best %s %s ever.',            'The %s %s you will never forget.',
    'Pure %s %s, nothing less.',       'Its your first %s %s all over again.',
    'We put the fun into your %s %s.', 'As unforgettable as your favorite %s %s.',
    "It's not just %s, its your %s.",  'Why settle for a regular %s %s?',
    'Your %s %s is now here!',         'All the %s %s for less.'
  ]

  REVIEW_PATTERNS = [
    'If you are looking for %s %s then this is the place. Could of used more %s %s but the overall experience was reasonable.',
    'I was looking for a %s %s but received a %s %s.',
    'My friend was always a stickler for %s %s but once I introduced her to the %s %s they have here she couldn\'t stop talking about it.',
    'Not only did I get an amazing %s %s, I also received a complimentary %s %s!',
    'The %s %s was ok. Next time I will have the %s %s instead.',
    'Tons of %s %s and %s %s.',
    'Probably the most %s %s and %s %s I have ever seen.'
  ]

  # The top 100 nouns in the English language
  TOP_100_NOUNS = %w{
    air         area        art         back        body        book        business    car         case        change
    child       city        community   company     country     day         door        education   end         eye
    face        fact        family      father      force       friend      game        girl        government  group
    guy         hand        head        health      history     home        hour        house       idea        information
    issue       job         kid         kind        law         level       life        line        lot         man
    member      minute      moment      money       month       morning     mother      name        night       number
    office      others      parent      part        party       people      person      place       point       power
    president   problem     program     question    reason      research    result      right       room        school
    service     side        state       story       student     study       system      teacher     team        thing
    time        war         water       way         week        woman       word        work        world       year
  }

  # The top 100 adjectives in the English language
  TOP_100_ADJECTIVES = %w{
    American      able          available     bad           best          better        big           black         blue
    central       certain       clear         close         cold          common        cultural      current       dark
    dead          democratic    different     difficult     early         easy          economic      entire        environmental
    federal       final         financial     fine          foreign       free          full          general       good
    great         green         happy         hard          high          hot           huge          human         important
    international large         late          left          legal         likely        little        local         long
    low           main          major         medical       military      national      natural       new           nice
    old           only          open          other         past          personal      physical      political     poor
    popular       possible      private       public        ready         real          recent        red           religious
    right         serious       short         significant   similar       simple        single        small         social
    special       strong        sure          traditional   true          various       white         whole         wrong
    young
  }

  NOUNS = %w{
    account        achiever       acoustics      act            action         activity       actor          addition
    adjustment     advertisement  advice         aftermath      afternoon      afterthought   agreement      air
    airplane       airport        alarm          alley          amount         amusement      anger          angle
    animal         answer         ant            ants           apparatus      apparel        apple          apples
    appliance      approval       arch           area           argument       arithmetic     arm            army
    art            attack         attempt        attention      attraction     aunt           authority      babies
    baby           back           badge          bag            bait           balance        ball           balloon
    balls          banana         band           base           baseball       basin          basket         basketball
    bat            bath           battle         bead           beam           bean           bear           bears
    beast          bed            bedroom        beds           bee            beef           beetle         beggar
    beginner       behavior       belief         believe        bell           bells          berry          bike
    bikes          bird           birds          birth          birthday       bit            bite           blade
    blood          blow           board          boat           boats          body           bomb           bone
    book           books          boot           border         bottle         boundary       box            boy
    boys           brain          brake          branch         brass          bread          breakfast      breath
    brick          bridge         brother        brothers       brush          bubble         bucket         building
    bulb           bun            burn           burst          bushes         business       butter         button
    cabbage        cable          cactus         cake           cakes          calculator     calendar       camera
    camp           can            cannon         canvas         cap            caption        car            card
    care           carpenter      carriage       cars           cart           case           cast           cat
    cats           cattle         cause          cave           celery         cellar         cemetery       cent
    chain          chair          chairs         chalk          chance         change         channel        cheese
    cherries       cherry         chess          chicken        chickens       child          children       chin
    church         circle         city           clam           class          clock          clocks         cloth
    cloud          clouds         clover         club           coach          coal           coast          coat
    cobweb         coil           collar         color          comb           comfort        committee      community
    company        comparison     competition    condition      connection     control        cook           copper
    copy           cord           cork           corn           cough          country        cover          cow
    cows           crack          cracker        crate          crayon         cream          creator        creature
    credit         crib           crime          crook          crow           crowd          crown          crush
    cry            cub            cup            current        curtain        curve          cushion        dad
    daughter       day            death          debt           decision       deer           degree         design
    desire         desk           destruction    detail         development    digestion      dime           dinner
    dinosaurs      direction      dirt           discovery      discussion     disease        disgust        distance
    distribution   division       dock           doctor         dog            dogs           doll           dolls
    donkey         door           downtown       drain          drawer         dress          drink          driving
    drop           drug           drum           duck           ducks          dust           ear            earth
    earthquake     edge           education      effect         egg            eggnog         eggs           elbow
    end            engine         error          event          example        exchange       existence      expansion
    experience     expert         eye            eyes           face           fact           fairies        fall
    family         fan            fang           farm           farmer         father         faucet         fear
    feast          feather        feeling        feet           fiction        field          fifth          fight
    finger         fire           fireman        fish           flag           flame          flavor         flesh
    flight         flock          floor          flower         flowers        fly            fog            fold
    food           foot           force          fork           form           fowl           frame          friction
    friend         friends        frog           frogs          front          fruit          fuel           furniture
    game           garden         gate           geese          ghost          giants         giraffe        girl
    girls          glass          glove          glue           goat           gold           goldfish       good-bye
    goose          government     governor       grade          grain          grandfather    grandmother    grape
    grass          grip           ground         group          growth         guide          guitar         gun
    guy            hair           haircut        hall           hammer         hand           hands          harbor
    harmony        hat            hate           head           health         hearing        heart          heat
    help           hen            hill           history        hobbies        hole           holiday        home
    honey          hook           hope           horn           horse          horses         hose           hospital
    hot            hour           house          houses         humor          hydrant        ice            icicle
    idea           impulse        income         increase       industry       information    ink            insect
    instrument     insurance      interest       invention      iron           island         issue          jail
    jam            jar            jeans          jelly          jellyfish      jewel          job            join
    joke           journey        judge          juice          jump           kettle         key            kick
    kid            kind           kiss           kite           kitten         kittens        kitty          knee
    knife          knot           knowledge      laborer        lace           ladybug        lake           lamp
    land           language       laugh          law            lawyer         lead           leaf           learning
    leather        leg            legs           letter         letters        lettuce        level          library
    life           lift           light          limit          line           linen          lip            liquid
    list           lizards        loaf           lock           locket         look           loss           lot
    love           low            lumber         lunch          lunchroom      machine        magic          maid
    mailbox        man            manager        map            marble         mark           market         mask
    mass           match          meal           measure        meat           meeting        member         memory
    men            metal          mice           middle         milk           mind           mine           minister
    mint           minute         mist           mitten         mom            moment         money          monkey
    month          moon           morning        mother         motion         mountain       mouth          move
    muscle         music          nail           name           nation         neck           need           needle
    nerve          nest           net            news           night          noise          north          nose
    note           notebook       number         nut            oatmeal        observation    ocean          offer
    office         oil            operation      opinion        orange         oranges        order          organization
    ornament       others         oven           owl            owner          page           pail           pain
    paint          pan            pancake        paper          parcel         parent         park           part
    partner        party          passenger      paste          patch          payment        peace          pear
    pen            pencil         people         person         pest           pet            pets           pickle
    picture        pie            pies           pig            pigs           pin            pipe           pizzas
    place          plane          planes         plant          plantation     plants         plastic        plate
    play           playground     pleasure       plot           plough         pocket         point          poison
    police         polish         pollution      popcorn        porter         position       pot            potato
    powder         power          president      price          print          prison         problem        process
    produce        profit         program        property       prose          protest        pull           pump
    punishment     purpose        push           quarter        quartz         queen          question       quicksand
    quiet          quill          quilt          quince         quiver         rabbit         rabbits        rail
    railway        rain           rainstorm      rake           range          rat            rate           ray
    reaction       reading        reason         receipt        recess         record         regret         relation
    religion       representative request        research       respect        rest           result         reward
    rhythm         rice           riddle         rifle          right          ring           rings          river
    road           robin          rock           rod            roll           roof           room           root
    rose           route          rub            rule           run            sack           sail           salt
    sand           scale          scarecrow      scarf          scene          scent          school         science
    scissors       screw          sea            seashore       seat           secretary      seed           selection
    self           sense          servant        service        shade          shake          shame          shape
    sheep          sheet          shelf          ship           shirt          shock          shoe           shoes
    shop           show           side           sidewalk       sign           silk           silver         sink
    sister         sisters        size           skate          skin           skirt          sky            slave
    sleep          sleet          slip           slope          smash          smell          smile          smoke
    snail          snails         snake          snakes         sneeze         snow           soap           society
    sock           soda           sofa           son            song           songs          sort           sound
    soup           space          spade          spark          spiders        sponge         spoon          spot
    spring         spy            square         squirrel       stage          stamp          star           start
    state          statement      station        steam          steel          stem           step           stew
    stick          sticks         stitch         stocking       stomach        stone          stop           store
    story          stove          stranger       straw          stream         street         stretch        string
    structure      student        study          substance      sugar          suggestion     suit           summer
    sun            support        surprise       sweater        swim           swing          system         table
    tail           talk           tank           taste          tax            teacher        teaching       team
    teeth          temper         tendency       tent           territory      test           texture        theory
    thing          things         thought        thread         thrill         throat         throne         thumb
    thunder        ticket         tiger          time           tin            title          toad           toe
    toes           tomatoes       tongue         tooth          toothbrush     toothpaste     top            touch
    town           toy            toys           trade          trail          train          trains         tramp
    transport      tray           treatment      tree           trees          trick          trip           trouble
    trousers       truck          trucks         tub            turkey         turn           twig           twist
    umbrella       uncle          underwear      unit           use            vacation       value          van
    vase           vegetable      veil           vein           verse          vessel         vest           view
    visitor        voice          volcano        volleyball     voyage         walk           wall           war
    wash           waste          watch          water          wave           waves          wax            way
    wealth         weather        week           weight         wheel          whip           whistle        wilderness
    wind           window         wine           wing           winter         wire           wish           woman
    women          wood           wool           word           work           world          worm           wound
    wren           wrench         wrist          writer         writing        yak            yam            yard
    yarn           year           yoke           zebra          zephyr         zinc           zipper         zoo
  }

  ADJECTIVES = %w{
    American        aback           abaft           abandoned       abashed         aberrant        abhorrent       abiding
    abject          ablaze          able            abnormal        aboard          aboriginal      abortive        abounding
    abrasive        abrupt          absent          absorbed        absorbing       abstracted      absurd          abundant
    abusive         acceptable      accessible      accidental      accurate        acid            acidic          acoustic
    acrid           actually        ad              adamant         adaptable       addicted        adhesive        adjoining
    adorable        adventurous     afraid          aggressive      agonizing       agreeable       ahead           ajar
    alcoholic       alert           alike           alive           alleged         alluring        aloof           amazing
    ambiguous       ambitious       amuck           amused          amusing         ancient         angry           animated
    annoyed         annoying        anxious         apathetic       aquatic         aromatic        arrogant        ashamed
    aspiring        assorted        astonishing     attractive      auspicious      automatic       available       average
    awake           aware           awesome         awful           axiomatic       bad             barbarous       bashful
    bawdy           beautiful       befitting       belligerent     beneficial      bent            berserk         best
    better          bewildered      big             billowy         bite-sized      bitter          bizarre         black
    black-and-white bloody          blue            blue-eyed       blushing        boiling         boorish         bored
    boring          bouncy          boundless       brainy          brash           brave           brawny          breakable
    breezy          brief           bright          broad           broken          brown           bumpy           burly
    bustling        busy            cagey           calculating     callous         calm            capable         capricious
    careful         careless        caring          cautious        ceaseless       central         certain         changeable
    charming        cheap           cheerful        chemical        chief           childlike       chilly          chivalrous
    chubby          chunky          clammy          classy          clean           clear           clever          cloistered
    close           closed          cloudy          clumsy          cluttered       coherent        cold            colorful
    colossal        combative       comfortable     common          complete        complex         concerned       condemned
    confused        conscious       cooing          cool            cooperative     coordinated     courageous      cowardly
    crabby          craven          crazy           creepy          crooked         crowded         cruel           cuddly
    cultural        cultured        cumbersome      curious         curly           current         curved          curvy
    cut             cute            cynical         daffy           daily           damaged         damaging        damp
    dangerous       dapper          dark            dashing         dazzling        dead            deadpan         deafening
    dear            debonair        decisive        decorous        deep            deeply          defeated        defective
    defiant         delicate        delicious       delightful      delirious       democratic      demonic         dependent
    depressed       deranged        descriptive     deserted        detailed        determined      devilish        didactic
    different       difficult       diligent        direful         dirty           disagreeable    disastrous      discreet
    disgusted       disgusting      disillusioned   dispensable     distinct        disturbed       divergent       dizzy
    domineering     doubtful        drab            draconian       dramatic        dreary          drunk           dry
    dull            dusty           dynamic         dysfunctional   eager           early           earsplitting    earthy
    easy            eatable         economic        educated        efficacious     efficient       eight           elastic
    elated          elderly         electric        elegant         elfin           elite           embarrassed     eminent
    empty           enchanted       enchanting      encouraging     endurable       energetic       enormous        entertaining
    enthusiastic    entire          envious         environmental   equable         equal           erect           erratic
    ethereal        evanescent      evasive         even            excellent       excited         exciting        exclusive
    exotic          expensive       extra-large     extra-small     exuberant       exultant        fabulous        faded
    faint           fair            faithful        fallacious      false           familiar        famous          fanatical
    fancy           fantastic       far             far-flung       fascinated      fast            fat             faulty
    fearful         fearless        federal         feeble          feigned         female          fertile         festive
    few             fierce          filthy          final           financial       fine            finicky         first
    five            fixed           flagrant        flaky           flashy          flat            flawless        flimsy
    flippant        flowery         fluffy          fluttering      foamy           foolish         foregoing       foreign
    forgetful       fortunate       four            fragile         frail           frantic         free            freezing
    frequent        fresh           fretful         friendly        frightened      frightening     full            fumbling
    functional      funny           furry           furtive         future          futuristic      fuzzy           gabby
    gainful         gamy            gaping          garrulous       gaudy           general         gentle          giant
    giddy           gifted          gigantic        glamorous       gleaming        glib            glistening      glorious
    glossy          godly           good            goofy           gorgeous        graceful        grandiose       grateful
    gratis          gray            greasy          great           greedy          green           grey            grieving
    groovy          grotesque       grouchy         grubby          gruesome        grumpy          guarded         guiltless
    gullible        gusty           guttural        habitual        half            hallowed        halting         handsome
    handsomely      handy           hanging         hapless         happy           hard            hard-to-find    harmonious
    harsh           hateful         heady           healthy         heartbreaking   heavenly        heavy           hellish
    helpful         helpless        hesitant        hideous         high            high-pitched    highfalutin     hilarious
    hissing         historical      hoc             holistic        hollow          homeless        homely          honorable
    horrible        hospitable      hot             huge            hulking         human           humdrum         humorous
    hungry          hurried         hurt            hushed          husky           hypnotic        hysterical      icky
    icy             idiotic         ignorant        ill             ill-fated       ill-informed    illegal         illustrious
    imaginary       immense         imminent        impartial       imperfect       impolite        important       imported
    impossible      incandescent    incompetent     inconclusive    incredible      industrious     inexpensive     infamous
    innate          innocent        inquisitive     insidious       instinctive     intelligent     interesting     internal
    international   invincible      irate           irritating      itchy           jaded           jagged          jazzy
    jealous         jittery         jobless         jolly           joyous          judicious       juicy           jumbled
    jumpy           juvenile        kaput           keen            kind            kindhearted     kindly          knotty
    knowing         knowledgeable   known           labored         lackadaisical   lacking         lame            lamentable
    languid         large           last            late            laughable       lavish          lazy            lean
    learned         left            legal           lethal          level           lewd            light           like
    likeable        likely          limping         literate        little          lively          living          local
    lonely          long            long-term       longing         loose           lopsided        loud            loutish
    lovely          loving          low             lowly           lucky           ludicrous       lumpy           lush
    luxuriant       lying           lyrical         macabre         macho           maddening       madly           magenta
    magical         magnificent     main            majestic        major           makeshift       male            malicious
    mammoth         maniacal        many            marked          married         marvelous       massive         material
    materialistic   mature          mean            measly          meaty           medical         meek            mellow
    melodic         melted          merciful        mere            messy           mighty          military        milky
    mindless        miniature       minor           miscreant       misty           mixed           moaning         modern
    moldy           momentous       motionless      mountainous     muddled         mundane         murky           mushy
    mute            mysterious      naive           nappy           narrow          nasty           national        natural
    naughty         nauseating      near            neat            nebulous        necessary       needless        needy
    neighborly      nervous         new             next            nice            nifty           nimble          nine
    nippy           noiseless       noisy           nonchalant      nondescript     nonstop         normal          nostalgic
    nosy            noxious         null            numberless      numerous        nutritious      nutty           oafish
    obedient        obeisant        obese           obnoxious       obscene         obsequious      observant       obsolete
    obtainable      oceanic         odd             offbeat         old             old-fashioned   omniscient      one
    onerous         only            open            opposite        optimal         orange          ordinary        organic
    ossified        other           outgoing        outrageous      outstanding     oval            overconfident   overjoyed
    overrated       overt           overwrought     painful         painstaking     pale            paltry          panicky
    panoramic       parallel        parched         parsimonious    past            pastoral        pathetic        peaceful
    penitent        perfect         periodic        permissible     perpetual       personal        petite          phobic
    physical        picayune        pink            piquant         placid          plain           plant           plastic
    plausible       pleasant        plucky          pointless       poised          polite          political       poor
    popular         possessive      possible        powerful        precious        premium         present         pretty
    previous        pricey          prickly         private         probable        productive      profuse         protective
    proud           psychedelic     psychotic       public          puffy           pumped          puny            purple
    purring         pushy           puzzled         puzzling        quack           quaint          quarrelsome     questionable
    quick           quickest        quiet           quirky          quixotic        quizzical       rabid           racial
    ragged          rainy           rambunctious    rampant         rapid           rare            raspy           ratty
    ready           real            rebel           recent          receptive       recondite       red             redundant
    reflective      regular         relieved        religious       remarkable      reminiscent     repulsive       resolute
    resonant        responsible     rhetorical      rich            right           righteous       rightful        rigid
    ripe            ritzy           roasted         robust          romantic        roomy           rotten          rough
    round           royal           ruddy           rude            rural           rustic          ruthless        sable
    sad             safe            salty           same            sassy           satisfying      savory          scandalous
    scarce          scared          scary           scattered       scientific      scintillating   scrawny         screeching
    second          second-hand     secret          secretive       sedate          seemly          selective       selfish
    separate        serious         shaggy          shaky           shallow         sharp           shiny           shivering
    shocking        short           shrill          shut            shy             sick            significant     silent
    silky           silly           similar         simple          simplistic      sincere         single          six
    skillful        skinny          sleepy          slim            slimy           slippery        sloppy          slow
    small           smart           smelly          smiling         smoggy          smooth          sneaky          snobbish
    snotty          social          soft            soggy           solid           somber          sophisticated   sordid
    sore            sour            sparkling       special         spectacular     spicy           spiffy          spiky
    spiritual       spiteful        splendid        spooky          spotless        spotted         spotty          spurious
    squalid         square          squealing       squeamish       staking         stale           standing        statuesque
    steadfast       steady          steep           stereotyped     sticky          stiff           stimulating     stingy
    stormy          straight        strange         striped         strong          stupendous      stupid          sturdy
    subdued         subsequent      substantial     successful      succinct        sudden          sulky           super
    superb          superficial     supreme         sure            swanky          sweet           sweltering      swift
    symptomatic     synonymous      taboo           tacit           tacky           talented        tall            tame
    tan             tangible        tangy           tart            tasteful        tasteless       tasty           tawdry
    tearful         tedious         teeny           teeny-tiny      telling         temporary       ten             tender
    tense           tenuous         terrible        terrific        tested          testy           thankful        therapeutic
    thick           thin            thinkable       third           thirsty         thoughtful      thoughtless     threatening
    three           thundering      tidy            tight           tightfisted     tiny            tired           tiresome
    toothsome       torpid          tough           towering        traditional     tranquil        trashy          tremendous
    tricky          trite           troubled        truculent       true            truthful        two             typical
    ubiquitous      ugliest         ugly            ultra           unable          unaccountable   unadvised       unarmed
    unbecoming      unbiased        uncovered       understood      undesirable     unequal         unequaled       uneven
    unhealthy       uninterested    unique          unkempt         unknown         unnatural       unruly          unsightly
    unsuitable      untidy          unused          unusual         unwieldy        unwritten       upbeat          uppity
    upset           uptight         used            useful          useless         utopian         utter           uttermost
    vacuous         vagabond        vague           valuable        various         vast            vengeful        venomous
    verdant         versed          victorious      vigorous        violent         violet          vivacious       voiceless
    volatile        voracious       vulgar          wacky           waggish         waiting         wakeful         wandering
    wanting         warlike         warm            wary            wasteful        watery          weak            wealthy
    weary           well-groomed    well-made       well-off        well-to-do      wet             whimsical       whispering
    white           whole           wholesale       wicked          wide            wide-eyed       wiggly          wild
    willing         windy           wiry            wise            wistful         witty           woebegone       womanly
    wonderful       wooden          woozy           workable        worried         worthless       wrathful        wretched
    wrong           wry             yellow          yielding        young           youthful        yummy           zany
    zealous         zesty           zippy           zonked
  }

end