LIST known_spirits = (fire), (water), earth, air, void, eagle, bear, snake, wolf, deer, owl, life, death, harmony, chaos, primordial 
VAR runes_retrieved = 1

CONST APONI = "Aponi"

VAR p_name = ""

VAR petrel_calls_me_by_name = false
VAR i_am_the_weaver = false

VAR p_karma = 3

-> Opening ->
-> Introduction ->
-> Chapter_1 ->
-> Chapter_2 ->
-> Chapter_3 ->
-> Epilogue ->
-> END

== Opening ==
Le Tisse-Esprit du hameau lointain ...
* ... a disparu.
* ... s'est évaporé.
* ... est parti.

- La guilde vous a choisi pour le remplacer car ...
* ... vous étiez la seule personne disponible.
* ... vous leur avez demandé.
* ... vous êtes dispensable.

- Avant de partir vous avez renouvelé votre voeu de ...
* ... servir la communauté de votre mieux.
* ... utiliser votre don de tissage de façon responsable.
* ... d'être au service de la seule et unique magie.
- 
* [Se mettre en chemin ... #clear]
->->

== Introduction ==

La route fut longue mais vous pouvez finalement voir un petit hameau devant vous.
    * [Vous reposer une minute]
    Vous vous arrêtez une minute en vous arrêtant sur une vieille souche pourissante.
    * [Continuer]
- Après quelques minutes de marche vous arrivez au village où Hototo l'ancien vous attendait. 
    * [Lui serrer la main]
    Vous serrez sa vieille main parcheminée et il vous sourit en retour.
    * [Hocher la tête respectueusement]
    Vous restez à distance, et inclinez respectueusement la tête.
- L'ancien a l'air heureux de vous voir.
Après quelques plaisanteries cordiales, l'ancien vous montre votre hutte et vous laisse à vos affaires.

- (house_warming)
    + [Regarder autour de vous]
    {La hutte est simple, mais très bien rangée. | Les murs ont l'air fades mais avec quelques améliorations vous vous sentirez très bientôt à la maison} -> house_warming
    * (unpack) [Décharger vos affaires]
    Vous déposez votre lourd paquetage sur le sol. La route fut longue.
    Vous commencez à organiser vos affaires sur les différentes étagères. Cordes colorées, branches odorantes, perles brillantes, runes de tissage. Tout est en ordre pour votre Art.
    -> house_warming
    * {unpack} [Aller vous coucher ]
    - Vous vous glissez sous les lourdes couvertures et tombez instantanément dans un profond sommeil. Demain sera une longue journée.
    * [... #start #day]
->->

== Chapter_1 ==
-> Intro ->
-> Aponi_01 ->
-> Kaya_01->

-> Night_01 -> 

-> Petrel_01 ->
-> Kaya_02 ->

-> Night_02 ->

-> Hototo_01 -> 
-> Petrel_02 ->

-> Night_03 ->

-> Hototo_02 ->

-> end


= Intro
Vous vous réveillez au son de lointain canards caquettant joyeusement.
Au bout de quelques minutes, vous entendez frapper à la porte.
->->

= Night_01
Alors que le soleil se couche, vous commencez à vous demander ce qui a pu arriver à l'ancien Tisse-Esprit. #nuit
Vous supposez ...
    * ... qu'il est mort de vieillesse après une vie accomplie à aider les autres.
    -> sleep
    * ... qu'une bête sauvage l'a tué.
    -> tragic_death
    * ... qu'une magie incontrôlée a provoqué sa disparition.
    -> tragic_death
    * ... que cela n'a pas vraiment d'importance.
    Vous êtes ici pour tisser et c'est ce que vous ferez.
    -> sleep
- (tragic_death) Un frisson vous parcourt l'échine. Vous n'aimez pas penser à ce genre de choses avant de vous coucher.
- (sleep)
    * [Aller dormir ... #clear #day]
->->

= Night_02
Le ciel est vraiment beau ce soir. #nuit
Alors que les nuages brûlent d'un orange vif, vous prenez un moment pour réfléchir à cette nouvelle rune que Kaya a trouvée.
Vous êtes perplexe parce que ...
* ... vous ne saviez pas qu'il y avait plus de deux runes de tissage.
* ... la rune ressemble étrangement à une ancienne magie interdite.
* ... comment une rune a-t-elle pu se retrouver à l'intérieur d'un cerf ?
-
Mais il se fait tard, vous aurez plus de temps demain pour enquêter sur le pouvoir de cette rune.
- 
* [Dormir ... #clear #day]
->->

= Night_03
C'est une bonne nuit pour se demander ... #nuit
* ... pourquoi personne ne mentionne jamais l'ancien Tisse-Esprit.
* ... pourquoi il y a un Tisse-Esprit permanent dans un si petit hameau.
* ... si vous rentrerez un jour chez vous.
-
* [Dormir ... #clear #day]
->->

= Aponi_01
    * [Ouvrir la porte]
- Sur votre porche, vous pouvez voir une petite fille. #aponi
    * [Lui faire signe d'entrer]
    Vous lui faites signe d'approcher et elle entre avec empressement. Vous pouvez voir qu'elle semble très curieuse.
- Bonjour, je m'appelle Aponi ! Comment tu t'appelles ? #c
    * Bonjour, je m'appelle Panthu. #p
    ~ p_name = "Panthu"
    * Bonjour, je m'appelle Juil. #p
    ~ p_name = "Juil"
    * Bonjour, je m'appelle Gytle. #p
    ~ p_name = "Gytle"
    * Bonjour. #p
- Enchantée {p_name}, bienvenue dans le village ! #c
Tu aimes les chiens ? #c
    * Absolument ! [] Tu en as un ? #p
    Oui ! Cilantro est mon meilleur ami ! #c
    * Pardon mon enfant, mais les chats sont bien meilleurs. #p
    * (dogs_are_the_worst) Non je les déteste ! Ils ont tué Frederik ... mon perroquet. #p
    Oh ... désolé. #c
- Au loin, vous entendez une voix forte appeler "Aponiiii".
Je dois y aller, à la prochaine ! #c
Elle vous sourit avant de courir dehors. #hide
* [... #clear]
->->

= Kaya_01
Plus tard dans la journée, vous entendez frapper fort.
    * [Ouvrir la porte]
- Vous là, Tisse-Esprit. J'ai besoin de votre aide pour quelque chose. #kaya #c
    * Huu ... Bonjour. #p
    Oui, bonjour. Comme je l'ai dit, j'ai besoin de votre aide rapidement. #c
    * En quoi puis-je vous aider ? #p
- Le bois que j'ai est trempé mais j'ai besoin d'allumer un feu tout de suite. Je ne peux pas laisser ce cerf se perdre. #c
- (choice)
    * (ask_kaya_too_much) Pourquoi avez-vous besoin du feu ? #p
    Pour le fumer. Pourquoi d'autre aurais-je besoin d'un feu pour un cerf ? Maintenant, puis-je l'avoir ? S'il vous plaît ? #c
    -> choice
    * Donnez-moi une minute, je vais voir ce que je peux faire. #p
        -> sprit_choice ->
        ** [fire]
        Elle hoche la tête brièvement <>
- et quitte votre cabane sans se retourner. #hide
* [... #clear]
->->

= Petrel_01
Tôt le matin, juste au moment où le coq chante, vous trouvez un homme robuste vous attendant sur le pas de votre porte.
    * [Le faire entrer]
- Bonjour honorable Tisse-Esprit. #c #petrel
Je suis désolé de vous déranger en une telle matinée paisible mais je n'avais pas d'autre choix. #c
-
    * (call_me_by_my_name) {p_name} S'il vous plaît, appelez-moi {p_name}. #p
    ~ petrel_calls_me_by_name = true
    Oui honorable tisser... pardon. Oui {p_name}. #c
    * Et vous êtes ? #p
    Désolé honorable Tisse-Esprit. #c
    * Comment puis-je vous aider ? #p
- Je m'appelle Petrel, je ne suis qu'un simple fermier ici. Je continue de prier les esprits mais il n'a pas plu depuis des semaines. J'ai peur que ma récolte ne survive pas sans eau. #c
S'il vous plaît {call_me_by_my_name: Honorable Tisse-Esprit ... {p_name} | Honorable Tisse-Esprit} Je vous en supplie.#c

- (ask_for_help)
    * (help_him) {ask_for_help > 1} D'accord ... #p
    -> sprit_choice ->
        ** [water]
        Son soulagement est presque palpable lorsque vous lui tendez l'attrape rêve.
        Merci mille fois {not call_me_by_my_name: Honorable Tisse-Esprit} ! #c
    * {ask_for_help == 1}Pas besoin de supplier[.], je vous aiderai avec plaisir. #p
    -> help_him
    * Suppliez et priez tout votre soûl, ça n'est pas comme ça que fonctionne la pluie. #p
    #c
    {not call_me_by_my_name: Oui Honorable Tisse-Esprit, vous avez raison, bien sûr.} Mais j'ai pensé que peut être ... ->ask_for_help
- Alors qu'il quitte la hutte vous vous demandez le genre de plantes qui sont cultivées dans la région. #hide
* [... #clear]
->->
 
    
    
    

= Kaya_02
Quelques instants plus tard, la porte s'ouvre avec fracas.
C'était un bon feu. #c #kaya
Mais c'était un mauvais cerf. #c
J'ai trouvé une rune étrange à l'intérieur.#c
Me suis dit que cela pouvait vous être utile.#c #add_rune
* Merci Kaya #p
~ runes_retrieved += 1
~ known_spirits += (air, earth)
-
{
- not ask_kaya_too_much: 
She nods a little bit longer than last time.
- else:
Don't sweat it. #c
}
Elle part avant que vous puissiez ajouter quoi que se soit. #hide
* [... #clear]
->->

= Hototo_01
Vous entendez le pas trainant de l'ancien s'approcher bien avant de le voir.
* [L'aider à rentrer]
- C'est très aimable à vous mon enfant. #c #hototo
Comment se passent les choses jusqu'ici? #c
    * Pour l'instant tout va bien #p[.] Merci pour votre accueil.
    Il sourit fièrement.
    * Et bien, #p[certaines personnes ont un comportement un  peu étrange.] J'imagine que je dois m'habituer aux coutumes locales.#p
    Hum ... oui ... en effet. Mais vous savez, ce sont des gens honnêtes, de bons travailleurs, tous autant qu'ils sont. Vous finirez par le comprendre, peut être même par les apprécier.#c
    * Ça ne vous regarde pas.#p
    Le vieil homme recule d'un pas. Vous pouvez déceler un éclair de peur dans le coin de ses yeux. Mais il se reprend rapidement.
- Il se racle la gorge.
Au fait, je...je ne voulais pas vous déranger avec les cauchermars d'un vieil homme... mais puisque je suis ici. #c
Cela fait plusieurs semaines que je rêve d'une ombre sombre qui m'étouffe. #c
Je peux à peine respirer et je me réveille en sueur. #c
Pourriez vous m'aider ? #c
* Bien sûr !
-> sprit_choice ->
** [air]
-Merci beaucoup mon enfant, cela m'a l'air vraiment prometteur. #c
- Il quitte la hutte, ses pas suivis de près par le son de sa canne sur le sol. #hide
* [... #clear]
->->

= Petrel_02
Juste avant que les derniers rayons du soleil ne disparaissent à l'horizon, vous voyez Petrel approcher.
* [lui faire signe d'entrer]
- Bonsoir {name_by_petrel()}. #c #petrel
Navré de vous déranger aussi tard.#c
    * Vous ne me dérangez jamais Petrel.#p
    * J'espère que ça sera bref.#p
- J'ai vu un signe du Grand Motif !#c
- (saw_a_sign)
    * Quel genre de signe ?#p
    A divine sign{light_name_by_petrel()}. Just like the ones you use to weave.#c
    -> saw_a_sign
    * (crop_circle) Where did you see this sign ?#p
    Dans mon champ{light_name_by_petrel()}.#c
    Grâce à votre aide, toute la récolte a poussé presque entièrement dans la nuit. A part dans certains endroits où le sol est resté vierge.#c
    Thanks to your help, the crop grew almost overnight. Except in some places where the ground remained barren.#c
    Je suis monté sur le toit de la grange pour avoir une meilleure vue et...#c
    C'est là que j'ai vu que c'était en réalité un signe divin! #c
    -> saw_a_sign
    * Le Grand Motif... ?#p
    Oui! Le motif derrière toute chose. Celui guidant ma main lorsque je laboure mon champ. Qui guide la votre lorsque vous tissez. Je suis profondément reconnaissant qu'Il m'ait choisi pour transmettre son message sacré.
    -> saw_a_sign
    * {crop_circle} Je me fiche de vos cercles de culture #p[.], Petrel. C'est sans doute des aliens qui vous jouent un tour.
    La terreur s'empare de son visage lorsque vous mentionnez des aliens.
    Mais...les aliens sont une corruption du Grand Motif...vous plaisantez ?#c
    -> saw_a_sign
    * {crop_circle} D'accord, puis-je le voir ? #p
- Biens sûr {light_name_by_petrel()}. Voici le Signe.#c
Il vous tend un bout de papier avec un petit dessin dessus, s'incline jusqu'au sol, puis s'en va. #add_rune #hide
~ runes_retrieved += 1
~ known_spirits += (void)
* [... #clear]
->->

= Hototo_02
Vous entendez les pas les plus lents du village s'approcher.
* [Ouvrir la porte]
- Merci pour votre aide mon enfant. Je peux à nouveau respirer aisément. #c #hototo
Mais je fais toujours des cauchemars...ou sont-ce plutôt des visions ?#c
Elle m'apparaissent maintenant même en plein milieu du jour.#c
S'il vous plait mon enfant, je fais appel à votre aide une fois de plus. Vous devez sûrement avoir quelque chose pour appaiser les pensées d'un vieil homme.#c
    * Mes soins n'ont donc pas suffit[...], donnez moi une minute je vais tenter de créer autre chose.  #p
    -> sprit_choice ->
        ** [void]
        Merci beaucoup à vous mon enfant. Je sens déjà mon angoisse disparaître.
        Thank you very much my dear child. I can already feel some of my anxiety receding.#c
        Mais j'ai toujours un mauvais pressentiment.#c
- De sombres et obscurs pouvoirs sont en oeuvre ici, je le sens. !#c
Dans ma dernière vision, j'ai vu une sorte de symbole étrange. Je l'ai dessiné pour vous. #c
*[Prendre le dessin]
- Le dessins vous absorbe à tel point que vous n'entendez même pas le vieil homme partie. #hide #add_rune
~ runes_retrieved += 1
~ known_spirits += (eagle, bear, snake)
* [Inspecter la rune ... #clear]
->->

= end
Tout ne semble pas clair au premier abord... #night
*[... Mais vous continuez à inspecter la rune.]
-Jour après jour.
*Nuit après nuit. 
- Cela fait des jours à présent. Peut être une semaine?
*Aujourd'hui vous avez enfin une révélation.
- Ce nouveau signe vous donne accès à un tout nouveau niveau de tissage.
Vous vous demandez si c'est contre cela que le vieil homme vous a mis en garde.
Vous sentez que vous devez ...
- (end_choice)
* ... procéder avec prudence[.] et ... -> end_choice
* ... explorer ces nouveaux pouvoirs[.] et ... -> end_choice
* ... profiter d'un repos bien mérité.
- 
* [... #clear #day]
->->

== Chapter_2 ==

-> Kaya_03 ->
-> Hyij_01 ->

-> Night_04 ->

-> Aponi_03 ->
-> Hototo_03 ->

-> end

= Kaya_03

La quiétude de l'aube naissante est interrompue par un visage familier sur le pas de votre porte.
Shhh #c #kaya
Elle place un doigt sur ses lèvres et pointe la forêt derrière elle
Est ce que vous entendez ? #c
    * Entendez quoi ?#p
    Exactement !#c
    * Huuum non ?#p
    * Je ne vous ai pas entendu dir bonjour ça c'est sûr.#p
    Elle vous fixe pendant une interminable minute. 
- A cette heure ci le bois devrait grouiller de vie mais je peine entendre le moindre son.#c
    * D'accord ...#p
    * Ça n'a pas l'air d'être mon problème si ?#p
- Comment puis-je chasser s'il n'y a rien à chasser?#c
Chaque jour je dois m'enfoncer plus loin, tout ça pour du maigre gibier. #c
- (choice)
    * (helped_kaya_hunt) D'accord je vais voir ce que je peux faire. #p
    -> sprit_choice ->
        ** [eagle]
        Elle s'arrête une minute pour vous adresser l'ombre d'un sourire.
    * Et en quoi est-ce mon problème ?#p
    Peut être parceque toute la viande que vous avez mangé jusqu'ici n'est pas venu gentiment toute seule dans votre assiette ?#c
    Mais ce n'est qu'une supposition...#c
    -> choice
- Sans un bruit, la voilà partie. #hide
* [... #clear]
->->

= Hyij_01
Cela fait ... 
* ... quoi, plus d'une semaine déjà ?
** Il vous reste de nouveaux visages à découvrir cependant.
*** Celle devant vous par exemple.
- Bonjour {my_name()}. #c #hyij
Nous n'avons pas eu le plaisir de nous rencontrer jusqu'ici. #c
Je suis Hyij, forgeronne.#c
    * Bievenue Hyij !#p
    * Bonjour Hyij, forgeronne.[] Je suis {p_name}, Tisse-Esprit.#p
    ~ i_am_the_weaver = true
- J'espère que vous l'installation s'est bien passée. #c
- Elle regarde d'un air navré les murs vides vous entourant.
- Je fais également des sculptures en métal sur mon temps libre. Je serai ravie de vous en offrir une pour ajouter un peu de décoration à votre hutte. #c
    * (accept_Hyij_gift) Avec plaisir[ !], merci Hyij !#p
    Très bien. Je vous en amènerai une la prochaine fois que je serai dans les environs. #c
    * Non, merci[.] Je préfère garder ma hutte sobre.#p
    D'accord, comme vous voudrez #c
- Elle a l'air de vouloir ajouter quelque chose mais a l'air hésitante.
    * En quoi puis-je vous aider Hyij?#p
    C'est bien aimable à vous de demander.#c
    * [...]
- C'est assez étrange mais je me sens de plus en plus épuisée ces jours-ci. #c
Parfois je me sens à peine la force de soulever mon marteau. #c
Seriez vous en mesure d'aider ?#c
    * Oui, bien sûr ![] Donnez moi une minute et vous vous sentirez la force d'un ours.#p
    -> sprit_choice ->
        ** bear
        Merci beaucoup! Cela sera d'une grande aide0 !#c
- {i_am_the_weaver: A bientôt {p_name: {p_name} Tisse-Esprit | Tisse-Esprit}.}#c
Elle vous salue alors qu'elle quitte la hutte. #hide
* [... #clear]
->->

= Night_04
La nuit est tombée plus tôt que ce que vous pensiez. #night
Est ce que les jours raccourcissent ?
Peut être que ...
* ... le temps file lorsque vous travaillez assidûment.
* ... c'est juste un ressenti de la météo.
* ... la fin du monde est proche.
-
* [... #clear #day]
->->

= Aponi_03
Le soleil approche de son zenith lorsque vous entendez quelqu'un sautiller en direction de la hutte.
C'est sûrement ...
    * ... Aponi ?
    * ... Hototo ?
    * ... Kaya ?
- Regarde ce que j'ai trouvé ! {my_name()} ! #c #aponi
On dirait l'une de tes cartes magiques ! #c
    * Parceque c'est une carte magique, Aponi. #p
    * On appelle ça une rune de tissage Aponi. #p
- Oooh#c
Elle est si belle !#c
    * Oui, mais elle est aussi très dangereuse#p[.] Tu devrais me la donner.
    Mais on dirait un simple caillou brillant !#c
    Elle regarde la rune un moment0.
    * Oui, maintenant donne la moi.#p
    * Est ce que je peux l'avoir s'il te plait ?#p
- Tiens prends là.#c #add_rune
~ runes_retrieved +=1
~ known_spirits += (deer, owl, wolf)
Je l'ai trouvée dans les cendres de la forge. #c
    * Les enfants ne devraient pas jouer près d'une forge#p[.], c'est très dangereux!
    Mais je cherchais juste Cilantro !#c
    * And pourquoi jouais tu près des cendres #p[?] d'abord ? 
    Je cherchais Cilantro.#c
- Je n'arrive pas à le trouer.#c
J'ai cherché partout pourtant#c
Est ce que tu peux m'aider s'il te plait s'il te plait ?#c
J'ai même essayé de l'appelé en hurlant comme il aime.#c
    * Oh le pauvre ... ne t'en fais pas, je vais t'aider #p[!] à trouver Cicero!
    * {Chapter_1.dogs_are_the_worst} C'est juste un vulgaire chien#p[.], pourquoi tu t'inquiètes autant ?
    S'il te plait.#c
    S'il te plait, s'il te plait, s'il te plait.#c
    C'est mon meilleur ami.#c
        **D'accord d'accord...juste laisse moi un instant#p
-
-> sprit_choice ->
* [wolf]
Oh merci !!#c
Merci, Merci, Merci !#c
Cilantrooooo !#c
Elle se précipite au dehors and se met à hurler dans toutes les directions. #hide
-
* [... #clear]
->->

= Hototo_03
Vous entendez encore quelques hurlement dans le lointain lorsqu'un faible coup résonne contre votre porte.
* [Open the door]
- Bonjour mon enfant. #c #hototo
    * Comment allez vous Hototo ? #p
    Je pourrais aller mieux... #c
    #c
    Enfin, les visions ont bien disparu, merci pour ça! Mais <>
    * Est ce que les vision ont disparu ?#p
    #c
    Oui oui, merci! <>
    * Avez vous d'autres runes pour moi ?#p
    Non ça n'est pas la raison de ma visite.#c
- Je n'arrive pas à échapper à ce sentiment que la fin se rapproche.#c
La mienne tout du moins.#c
    * Ne vous en faites pas, c'est juste une mauvaise journée.#p
    Non non ce n'est pas ça.#c
    * [...]
- Je peux le sentir profondément. Dans mes os et ma chair.#c
C'est amusant vous savez. A mon grand âge je devrais au contraire attendre impatiemment la venue de la longue nuit.#c
Tout comme la chouette.#c
Il existe toujours un chemin pour ceux capables de voir.#c
    * Cela me fend le coeur d'entendre cela. #p
        ** Je dois pouvoir trouver un moyen de vous aider. #p
- -> sprit_choice ->
* [owl]
- Il sourit avec mélancolie, le regard dans le lointain, mais plus serein. Il s'incline légèrement et s'en va. #hide
* [... #clear]
->->

= end
Il fait déjà bien sombre lorsque vous voyez Aponi, heureuse comme jamais. #aponi
A ses côtés et haletant joyeusement, vous voyez son chien Cilantro.
Elle vous serre contre elle un long moment.
* [...]
- Regarde ce que j'ai trouvé dans la forêt ! #c #add_rune
Elle vous donne de nouveau une rune inconnue avant de repartir avec son loyal compagnon. #hide
~ runes_retrieved += 1
Elle a déjà presque disparu lorsque vous l'entendez crier "Bonne nuit!!"
* [... #clear]
- Une fois votre solitude retrouvée vous commencez à méditer à la signification de tout ceci. #night
D'où viennent toutes ces runes ?
Pourquoi semblent-elles s'appeler? S'entrainant les unes les autres? 
Vous espérez sincèrement que...
* ... vous découvrirez la vérité.
* ... vous protégerez tout le monde.
* ... ce n'est pas la fin du monde.
- 
* [Go to sleep]
Alors que vous vous couchez, vous entendez une chouette hululer, seule dans la nuit profonde.
** [... #clear #day]
->->


== Chapter_3 ==

-> Petrel_03 ->
-> Aponi_04 ->
-> Hyij_03 ->

-> Night_05 ->

-> Hototo_04 ->

-> end

= Petrel_03
De lourds coups sur votre porte vous réveillent.
*[Get up]
-Votre hutte est encore très sombre, à part un lointain mince éclat de lumière.
L'aube ne doit pas être encore levée.
{name_by_petrel()} ! #c
*[Open the door]
-{name_by_petrel()} ! #c #petrel
J'implore votre aide toute puissante {name_by_petrel()}.#c
Kaya a grièvement blessé Fennel.#c
Elle va mourir si rien n'est fait!#c
~ temp fennel_is_a_cow = false
- (fennel_in_danger)
    * {fennel_is_a_cow} Kaya a fait quoi ???#p
    Elle a tiré sur Fennel avec son arc.#c
    Pourquoi a-t-elle fait une chose pareille ?#c
    Qu'elle ait été perdue dans la forêt n'est quand même pas une raison pour tirer sur une vache !#c
    ~ fennel_is_a_cow = true
    -> fennel_in_danger
    * {not fennel_is_a_cow} Qui est Fennel ???#p
    C'est une fière servante du Grand Motif !#c
    Et l'une de mes meilleures vaches !#c
    ~ fennel_is_a_cow = true
    -> fennel_in_danger
    * {fennel_is_a_cow} Mais pourquoi Kaya tirerait elle sur votre vache ???#p
    Elle l'a confondue avec du vulgaire gibier dans la forêt !#c
    -> fennel_in_danger
    * (weaving) Il {fennel_in_danger < 2:n'y a pas de temps à perdre !| de l'espoir.}#p[] Je vais tisser ce qu'il faut !
    -> sprit_choice ->
        ** [life]
- Le Grand Motif soit loué !#c
Merci {name_by_petrel()} !#c
Avec ça ma vache sera sauvée !#c
Dès que vous lui remettez l'attrape-rêve il se met à courir en direction de la forêt #hide
- 
*[... #clear]
->->

= Aponi_04
Vous vous apprêtez à fermer la porte mais je remarquez un petit dessin sur le sol juste devant chez vous.
*[Pick it up]
- C'est un dessin d'enfant.
Dans le coin en bas à droite vous voyez ...
-(drawing_1){drawing_1 > 2:. -> drawing_2}{drawing_1 > 1: and ...}
* ... un bonhomme baton[ ?]->drawing_1
* ... ce qui ressemble à un ... chien [ ?]->drawing_1
-(drawing_2) Entre les deux flotte un petit coeur.
Au milieu du dessin vous voyez très clairement ...
* ... une vache[.] ...
** ... debout en pleine forme.
Mais sur le sol où elle reposait avant ... #add_rune
*** ... l'herbe couchée forme le motif ...
**** ... d'une rune !
~ runes_retrieved += 1
-
*[... #clear]
->->

= Hyij_03
Plus tard dans la journée, vous entendez Hyij toquer à votre porte.
* Entrez ! #p
- Bonjour {name_by_hyij()} ! #c #hyij
Ce que vous avez réussi pour Fennel est vraiment impressionnant.#c
    * Merci !#p
    Non, merci à vous !#c
    * Oh, ça n'était pas grand chose ...#p
    C'est tout de même d'une aide inestimable.#c
- Cependant depuis l'incident les choses sont devenues...tendues entre Petrel et Kaya.#c
Je crains que la petite paix tranquille de notre communauté n'en souffre grandement si nous laissons le conflit s'envenimer.#c
Vous n'auriez pas quelque chose pour aider par hasard ?#c
* En effet, je pense avoir quelque chose.#p
* Si j'ai vu invoquer la Vie, je peux sûrement faire de même avec l'Harmonie !#p
- ->sprit_choice->
* [harmony]
- Merci beaucoup {my_name()} !#c
Il y a des jours où je me demande ce que nous ferions sans vous.#c
    * Moi aussi#p[.], moi aussi...
    * J'essaie juste de faire de mon mieux.#p
    Et nous vous en sommes extrêmement reconnaissants.#c
-{not Chapter_2.accept_Hyij_gift: ->goodbye}
Oh j'ai presque oublié!#c
Comme promis, voilà un petit bibelot que j'ai fait pour vous#c
    * Oh ! Hyij, c'est magnifique!#p
    * Merci ! La décoration parfaite pour mes murs fades !#p
- Que voulez vous, c'est l'art de vos attrapes-rêves qui m'inspire.#c
-(goodbye)
Enfin bon, je vous laisse à vos affaires maintenant. #c
Elle vous salue et referme la porte doucement derrière elle. #hide
*[... #clear]
->->


= Night_05
Aujourd'hui était une belle journée. #night
Vous vous sentez particulièrement bien grâce à ...
* ... votre capacité à aider les autres.
* ... la confiance que le hameau place en vous.
* ... la quantité de pouvois que vous amassé.
- 
*[Go to sleep]
** Vous tentez de dormir ...
*** ...mais quelque chose vous tourmente.
**** Pourquoi l'air semble si lourd ici ?
***** Quel est ce battement sinistre à l'intérieur de votre crâne ?
- Les soucis et de sombres pressentiment vous angoissent longtemps, mais vous finissez par dériver vers un sommeil agité.
*[... #clear #day]
->->


= Hototo_04
Vous vous réveillez en bien meilleure forme.
Vous vous sentez toujours mieux ...
* ... en sentant le soleil sur votre visage.
* ... en entendant les chants des oiseaux.
-
*[...]
- Au début de l'après-midi, vous voyez Hototo s'approcher lentement avec Hyij.
Bonjour mon enfant. #c #hototo
Aujourd'hui est un grand jour.#c
*[...]
-Aujourd'hui est le jour où les étoiles et les ancêtres m'appellent à les rejoindre.#c
*[...]
-J'ai eu une longue et heureuse vie.#c
*[...]
-J'ai une confiance totale en Hyij, elle sera une bonne ancienne.#c
*[...]
-Je suis reconnaissant que la vie m'ait permis de vous rencontrer.#c
Et je voulais vous remercier encore une fois de toute votre aide. Particulièrement lors de ces derniers jours.#c
*[...]
-Il vous regarde pendant un long moment.
*[...]
-Maintenant, vous savez ce qui doit être fait.#c
*[Vous préparez à la cérémonie]
-
-> sprit_choice ->
* [death]
-Vous achevez l'attrape-rêve et vous lui tendez d'une main hésitante.
Pour la dernière fois, vous voyez sa frêle silhouette s'éloigner en directiond de sa hutte, Hyij a ses côtés. #hide
*[... #clear]
->->

= end
Quelques jours passent. #night
* Une idée gagne votre esprit.
** Vous essayez de l'ignorer ...
*** ... mais elle ne cesse de revenir.
**** Quelqu'un a-t-il déjà essayé de tisser le motif ultime ?
***** C'est sûrement trop dangereux...
****** Mais est ce que quelqu'un a essayé ?
- Porbablement pas. Plus vous y pensez ...
-(thinking){thinking > 2:. -> thinking_2}{thinking > 1: and ...}
* ... plus celà semble dangereux[.]->thinking
* ... moins cela semble possible[.]->thinking
- (thinking_2)
Vous ne savez même pas quelle genre de rune pourrait permettre cela.
Vous essayez de vous changer les idées en ...
* ... donnant un coup de main à Petrel dans les champs.
* ... aidant Hyij à la forge.
* ... apprenant à chasser aux côtés de Kaya.
* ... jouant gaiement avec Aponi et Cilantro.
-
*[...]
-
Une nuit vous vous réveillez en sueur et la seule chose à laquelle vous pouvez penser est ...
*... est ce que quelqu'un a déjà essayé de tisser le motif ultime ?
*... est ce que quelqu'un a déjà essayé de tisser le motif ultime ?
*... est ce que quelqu'un a déjà essayé de tisser le motif ultime ?
-
*... est ce que quelqu'un a essayé de connecter tous les esprits en même temps ?
*... est ce que quelqu'un a essayé de connecter tous les esprits en même temps ?
*... est ce que quelqu'un a essayé de connecter tous les esprits en même temps ?
-
*Les contours d'une rune que vous n'avez encore jamais vue s'impose, brûlante, dans votre esprit. 
-#add_rune #epilogue_music
* Vous vous devez d'essayer. #day
- Vous devez essayer de connecter tous les esprits à la fois !
->sprit_choice->
* [pattern]
-
*[...]
->->


== Epilogue ==
* Un sombre et profond grondement s'élève tout autour de vous.
** Le sol se met à trembler comme il n'a jamais tremblé.
*** Toutes les lumières disparaissent ...
**** ... absorbées par ...
***** ... un terrifiant nuage de noirceur.
***** ... une déchirure dans la trame de la réalité.
***** ... une vision hurlante de pouvoir.
- ENFIN ! #c #pattern
- (where_sacrifice) OÙ EST MON TRIBUT ESCLAVE ? #c
    * {where_sacrifice < 2} [...] -> where_sacrifice
    * Qui ... Que ... qu'êtes ... vous ? #p
    JE NE SUIS RIEN. #c
    JE SUIS TOUT. #c
    JE SUIS LE MOTIF. #c
    OÙ EST MON TRIBUT ? #c
    * Votre ... tribut ? #p
    OUI.#c
    MON TRIBUT. MON SACRIFICE.#c
    OÙ EST IL ?#c
-
* Votre sacrifice ? #c #clear #hide
- #night
- (sacrifice) {|ÇA N'EST PAS ASSEZ. J'AI BESOIN DE PLUS ! | J'AI BESOIN DE PLUS ! | PLUS ! | ENCORE ! |  PLUS DE SACRIFICE !!!! | IL ME FAUT ENCORE UN DERNIER SACRIFICE, ESCLAVE !}#c 
    * [Sacrifice Cilantro.] Vous offrez Cilantro.
    * [Sacrifice Fennel.] Vous offrez Fennel.
    * {sacrifice > 1} [Sacrifice Aponi.] Vous offrez Aponi.
    * {sacrifice > 1} [Sacrifice Kaya.] Vous offrez Kaya.
    * {sacrifice > 1} [Sacrifice Petrel.] Vous offrez Petrel.
    * {sacrifice > 1} [Sacrifice Hyij.] Vous offrez Hyij.
    * [Sacrifice yourself. #clear]-> self_sacrifice
- ->sacrifice

-(self_sacrifice) Très bien, je suis vôtre.#p
Alors que vous balbultiez ces mots vous commencez à sentir ...
* ... une douleur intense.
** Vous tentez de crier.
*** Mais aucun son ne sort.
**** Votre vision commence à flancher.
***** Vous voyez des runes voler dans toutes les directions.
****** Elles fracassent les murs de votre hutte et s'envolent.
******* Alors que l'obscurité vous engloutit, une dernière pensée vous traverse.
-
* Vous espérez que votre sacrifice apaisera le Motif.
* Vous vous demandez si c'est ce qu'il est arrivé à votre prédécesseur.
* Yay, vous avez réussi à tisser le motif ultime !
-
* FIN. #clear
- Merci d'avoir joué !
->->

== function my_name ==
{p_name: {p_name}|}

== function name_by_hyij
{
-i_am_the_weaver: 
{p_name: {p_name} Tisse-Esprit | Tisse-Esprit}
-else:
{p_name: {p_name}}
}

== function light_name_by_petrel ==
{not petrel_calls_me_by_name: Tisse-Esprit}

== function name_by_petrel ==
{not petrel_calls_me_by_name: Tisse-Esprit| {p_name}}

== sprit_choice ==
+ Choose a spirit : {known_spirits} #spirit_choice
-   
->->
 