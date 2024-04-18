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
    -> dormir
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
    * Et bien, #p[certaines personnes ont un comportement un  peu étrange.] J'imagine que je dois m'habituer .#p
    Ah ... right ... yes. Well, they are honest, hardworking people, all of them. You'll come to understand, maybe even like them in the end.#c
    * It's none of you concern.#p
    The old man seems taken a back. You can see a hint of fright in the corner of his eyes. But he quickly recomposes himself.
- He clears his throat.
I ... didn't want to bother you with an old man nightmares ... but since I'm here.#c
Since a few weeks now I dream of a dark shadow strangling me. #c
I wake up in sweat and can hardly breathe. #c
Would you be able to help me ? #c
* Sure !
-> sprit_choice ->
** [air]
-Thank you very much my child. This seems very promising. #c
- He leaves your hut with the sound of his cane following his footsteps. #hide
* [... #clear]
->->

= Petrel_02
Just before the last rays of the sun disappear below the horizon, you see Petrel approaching.
* [wave him in]
- Hello {name_by_petrel()}. #c #petrel
Sorry to bother you so late.#c
    * You never bother me Petrel.#p
    * Yes, you better be quick.#p
- I saw a sign of the holy pattern today !#c
- (saw_a_sign)
    * What kind of sign ?#p
    A divine sign{light_name_by_petrel()}. Just like the ones you use to weave.#c
    -> saw_a_sign
    * (crop_circle) Where did you see this sign ?#p
    In my field{light_name_by_petrel()}.#c
    Thanks to your help, the crop grew almost overnight. Except in some places where the ground remained barren.#c
    I had to climb to the top of the barn to get a better view.#c
    That's when I saw it was in fact a divine sign {light_name_by_petrel()}.#c
    -> saw_a_sign
    * The holy pattern ... ?#p
    Yes, the one thing behind everything. Guiding my hand when I plow my field. Guiding yours as you weave. I'm honored the Holy Pattern chose me to deliver its divine message.#c
    -> saw_a_sign
    * {crop_circle} I don't care much for your crop circles#p[.], Petrel. Maybe some aliens wanted to mess with you and so what.
    A terror take hold of his face when you mention aliens.
    But aliens are a corruption of the Holy Pattern, surely you must be joking.#c
    -> saw_a_sign
    * {crop_circle} Okay, can I see it ? #p
- Yes{light_name_by_petrel()}. Here's the Sign.#c
He give you a paper with a small drawing on it, bows to the ground, then leaves. #add_rune #hide
~ runes_retrieved += 1
~ known_spirits += (void)
* [... #clear]
->->

= Hototo_02
You can hear the slowest footstep of the village approaching.
* [Open the door]
- Thank you for your help child. I can now breathe easily again. #c #hototo
But I still have nightmares ... or should I call them visions ?#c
They are now coming to me in the middle of the day.#c
Please child, i'm once again asking for your help. You must have something to clear and soothe the mind of an old man.#c
    * I'm [sorry, I'll see what I can do.] very sorry to hear that. Give me a minute I'll craft you a remedy. #p
    -> sprit_choice ->
        ** [void]
        Thank you very much my dear child. I can already feel some of my anxiety receding.#c
        But I still have a bad feeling.#c
- Dark and forgotten powers are at stakes, I can feel it !#c
In my last vision I saw some kind of rune. Here, I've drawn it for you.#c
*[Take the drawing]
- You're so fixated on the drawing that you don't even notice the old man leaving. #hide #add_rune
~ runes_retrieved += 1
~ known_spirits += (eagle, bear, snake)
* [Study the rune ... #clear]
->->

= end
At first something eludes you ...#night
*[... but you keep on studying the rune.]
-Day after day.
*Night after night. 
-It must be a week now.
*But today you had a breakthrough.
-This new sign will let you acces a whole new level of weaving.
You wonder if that was what the old man was warning you about.
You feel like you must ...
- (end_choice)
* ... proceed with caution[.] and ... -> end_choice
* ... explore these new powers[.] and ... -> end_choice
* ... get a well deserved rest.
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
The dawn breaks with a familiar face on your doorstep.
Shhh #c #kaya
She put a finger to her mouth and point behind her.
Can you hear anything ? #c
    * Hear what ?#p
    Exactly !#c
    * Huuu ... no ?#p
    * I didn't hear you say hello, that's for sure.#p
    She stares at you for a hard long minute. 
- At this hour, the wood should be teeming with life but I can barely hear a thing.#c
    * Okay ...#p
    * Doesn't look like it's my problem, does it ?#p
- How can I hunt if there's nothing to hunt.#c
Each day I must go further into the wood, only to find meagre game.#c
- (choice)
    * (helped_kaya_hunt) Okay, let me see what I can do.#p
    -> sprit_choice ->
        ** [eagle]
        She pauses a minute to give you the faintest smile.
    * And how is that my problem ?#p
    Maybe because all this meat you've eaten since you're here won't get in your plate by itself ?#c
    Just guessing ...#c
    -> choice
- Without a noise, she's gone. #hide
* [... #clear]
->->

= Hyij_01
It's been ... 
* ... what, one week already ?
** You still have new faces to discover though.
*** Just like the one in front of you.
- Hello{my_name()}. #c #hyij
We haven't had the pleasure to meet yet. #c
I'm Hyij, the blacksmith.#c
    * Nice to meet you Hyij !#p
    * Hello Hyij, the blacksmith.[] I'm {p_name} the Weaver.#p
    ~ i_am_the_weaver = true
-I hope you're all settled. When I have the time I also do a few metal sculptures.#c
I'd be happy to gift you one if you'd like to decorate those bland walls in your hut.#c
    * (accept_Hyij_gift) With great pleasure[ !], thank you Hyij !#p
    Alright, I'll bring you one next time I'm around.#c
    * No, thank you[.] I like my wall blands.#p
    Okay, as you wish#c
- She looks like she wants to add something but seem uncertain.
    * Please, what can I help you with Hyij ?#p
    That's very nice of you to ask.#c
    * [...]
- It's quite weird but I feel more and more tired these days.#c
Sometimes I hardly have the strengh to lift my hammer anymore.#c
Would you be able to help ?#c
    * Yes, absolutely ![] Give me a minute and you'll feel strong as a bear.#p
    -> sprit_choice ->
        ** bear
        Thank you very much, this should be a huge help !#c
- {i_am_the_weaver: See you around {p_name: {p_name} the weaver | Weaver}.}#c
She wave you goodbye as she leaves the hut. #hide
* [... #clear]
->->

= Night_04
The night fell sooner than you'd expected.#night
Are the day getting shorter ?
Maybe ...
* ... time flies when you work hard.
* ... it's just a weather thing.
* ... the end of the world is near.
-
* [... #clear #day]
->->

= Aponi_03
Noon is around the corner and you hear someone running jauntily toward the hut.
It must be ...
    * ... Aponi ?
    * ... Hototo ?
    * ... Kaya ?
- Look what I found{my_name()} ! #c #aponi
It looks just like your magic cards ! #c
    * Because it is a magic card Aponi. #p
    * It's called a weaving rune Aponi. #p
- Oooh#c
It's so pretty !#c
    * Yes, but it's also very dangerous#p[.] You should give it to me.
    But it just look like a dumb rock.#c
    She looks at the rune a moment.
    * Yes, now give it to me.#p
    * Can I have it please ?#p
- Here take it.#c #add_rune
~ runes_retrieved +=1
~ known_spirits += (deer, owl, wolf)
I found it the ashes of the forge anyway. #c
    * Kids shouldn't play around a forge#p[.], it's very dangerous !
    But I was looking for Cilantro !#c
    * And why were you playing with the ashes #p[?]in the first place ?
    I was looking for Cilantro.#c
- I can't find him.#c
I've looked everywhere.#c
Can you help me pretty please ?#c
I've even tried to howl like he likes.#c
    * Oh poor thing ... don't worry I will help you #p[!]find Cilantro !
    * {Chapter_1.dogs_are_the_worst} It's just a stupid dog#p[.], why do you care about it ?
    Please.#c
    Please, please, please.#c
    He's my best friend.#c
        **Okay ... give me a moment.#p
-
-> sprit_choice ->
* [wolf]
Thank you !#c
Thank you, thank you, thank you !#c
Cilantrooooo !#c
She runs outside and starts howling in every direction. #hide
-
* [... #clear]
->->

= Hototo_03
You're still hearing a few howls in the distance when a weak knock sound against your door.
* [Open the door]
- Hello my child. #c #hototo
    * How are you Hototo ? #p
    It could be better. #c
    #c
    I mean, the visions disappeared, thank you ! But <>
    * Have the visions disappeared ?#p
    #c
    Yes they have, thank you ! But <>
    * Do you have more runes for me ?#p
    No, that's not why I'm here today.#c
- I can't escape this feeling that the end is near.#c
My end at least.#c
    * Don't worry, it's just a bad day.#p
    No it's not.#c
    * [...]
- I can feel it in my bones.#c
It's funny you know. At my age, I should be waiting eagerly for the long night.#c
Just like the owl.#c
There's always a path for those able to see.#c
    * I'm so sorry to hear that. #p
        ** I may be able to ease your way. #p
- -> sprit_choice ->
* [owl]
-He smiles with melancoly, bows a little and then leaves. #hide
* [... #clear]
->->

= end
It's already dark when you see Aponi, happy like never before. #aponi
At her side and happily panting, you see Cilantro.
She hugs you for a long moment.
* [...]
- Look what we found in the forest ! #c #add_rune
She gives you yet another rune before running off with her trusty friend. #hide
~ runes_retrieved += 1
She's already almost disappeared when you hear screaming back : "goodnight !"
* [... #clear]
- Once alone you start to ponder the meaning of all of this. #night
Where do these runes come from ?
Why do they seem to call eachother ?
You dearly hope ...
* ... you'll get to the bottom of this.
* ... you'll keep everyone safe.
* ... it's not the end of the world.
- 
* [Go to sleep]
As you go to bed, you can hear an owl sing, lonely in the dark night.
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
Loud bangs wake you up.
*[Get up]
-Your hut is really dark, except the tinyest sliver of light.
It couldn't be much past dawn.
{name_by_petrel()} ! #c
*[Open the door]
-{name_by_petrel()} ! #c #petrel
I implore your omnipotent help {name_by_petrel()}.#c
Kaya greatly wounded Fennel.#c
She'll die if we don't do something fast !#c
~ temp fennel_is_a_cow = false
- (fennel_in_danger)
    * {fennel_is_a_cow} Kaya did what ???#p
    She shot Fennel with her bow.#c
    Why would someone do that ?#c
    That she was lost in the forest isn't a reason to shoot on a cow !#c
    ~ fennel_is_a_cow = true
    -> fennel_in_danger
    * {not fennel_is_a_cow} Who's Fennel ???#p
    She's a proud servant of the Holy Pattern !#c
    And one of my favorite cows !#c
    ~ fennel_is_a_cow = true
    -> fennel_in_danger
    * {fennel_is_a_cow} Why would Kaya shoot your cow ???#p
    She misstook it for some vulgar game in the forest !#c
    -> fennel_in_danger
    * (weaving) There's {fennel_in_danger < 2:no time to loose !| hope.}#p[] I'll weave something !
    -> sprit_choice ->
        ** [life]
- Thank the Holy Pattern !#c
Thank you {name_by_petrel()} !#c
With that my cow must be saved !#c
As soon as you give him the dream catcher, he runs in the direction of the forest. #hide
- 
*[... #clear]
->->

= Aponi_04
You're about to close the door but you notice a small drawing on the floor just outside.
*[Pick it up]
- It's a child's drawing.
In the bottom right corner you spot ...
-(drawing_1){drawing_1 > 2:. -> drawing_2}{drawing_1 > 1: and ...}
* ... a small stick figure[ ?]->drawing_1
* ... what looks like a dog[ ?]->drawing_1
-(drawing_2) Between the two of them floats a little heart.
In the middle of the drawing you clearly see ...
* ... a cow[.] ...
** ... healthy.
But on the ground ... #add_rune
*** ... the trampled grass draws ...
**** ... a rune !
~ runes_retrieved += 1
-
*[... #clear]
->->

= Hyij_03
Later in the day, you hear Hyij knocking on your door.
* Come on in ! #p
- Hello{name_by_hyij()} ! #c #hyij
What you did for Fennel truly is impressive.#c
    * Thank you !#p
    No, thank you !#c
    * Oh, it wasn't much ...#p
    It's still greatly appreciated.#c
- However since this incident it's getting tense between Petrel and Kaya.#c
I'm affraid the little harmony we have here will shatter if we let the conflict fester.#c
You wouldn't have something to help, would you ?#c
* Indeed, I have.#p
* If I can control Life, surely I can invoke Harmony !#p
- ->sprit_choice->
* [harmony]
- Thank you{my_name()} !#c
Some days, I wonder what we would do without you.#c
    * So do I#p[.], so do I.
    * I'm just doing my best.#p
    And for that we are deeply grateful.#c
-{not Chapter_2.accept_Hyij_gift: ->goodbye}
I almost forgot!#c
Like I promised, here's a small trinket I made for you.#c
    * Oh ! Hyij, it's beautiful !#p
    * Thank you ! The perfect complement to my bland walls !#p
- What can I say, all those dream catchers you craft inspired me.#c
-(goodbye)
Anyway, I'll leave you to your things now. #c
She waves goodbye and closes the door softly behind her. #hide
*[... #clear]
->->


= Night_05
Today was great. #night
You're especially fulfilled by ...
* ... your ability to help others.
* ... the trust the hamlet puts in you.
* ... the amount of power you have garnered.
- 
*[Go to sleep]
** You try to sleep ...
*** ...but something keeps nagging at you.
**** Why does the air feels so thick in here ?
***** What is that sinister pounding inside your head ?
- Dizzy with worries and a dark hunch, you finally drift to sleep.
*[... #clear #day]
->->


= Hototo_04
You wake up feeling better.
You always feel better ...
* ... feeling the sun on your face.
* ... hearing birds chirping.
-
*[...]
- In the beggining of the afternoon, you see Hototo slowly approaching with Hyij.
Hello my dear child. #c #hototo
Today is a big day.#c
*[...]
-Today I'll finally rejoin my ancestors.#c
*[...]
-I've had and long and happy life.#c
*[...]
-I have absolute faith in Hyij, she'll be a fine elder.#c
*[...]
-I'm glad I had the chance to meet you.#c
And I wanted to thank you one more time for all your help. Especially these last few days.#c
*[...]
-He looks at your for a long time.
*[...]
-Now, you know what must be done.#c
*[Prepare for the ceremony]
-
-> sprit_choice ->
* [death]
-You finish to weave the dream catcher and give it to him.
For the lasty time, you watch him leave in the direction of his home, Hyij by his side. #hide
*[... #clear]
->->

= end
A few day pass. #night
* An idea pops into your head.
** You try to forget it ...
*** ... but it keeps comming back.
**** Has anyone ever tried summoning every spirit at once ?
***** It's probably too dangerous.
****** But has anybody tried ?
-Probably not, the more you think about it ...
-(thinking){thinking > 2:. -> thinking_2}{thinking > 1: and ...}
* ... the more dangerous it feels[.]->thinking
* ... the less plausible it seems[.]->thinking
- (thinking_2)
You do not even know what rune could allow that.
You try to change your mind and focus on ...
* ... lending a hand to Petrel in the fields.
* ... helping Hyij at the forge.
* ... learning to hunt with Kaya.
* ... playing with Aponi and Cilantro.
-
*[...]
-
One night you wake up in sweat and all you can think about is ...
*... has anybody tried to summon every spirit at once ?
*... has anybody tried to summon every spirit at once ?
*... has anybody tried to summon every spirit at once ?
- The outline of a rune you've never seen before burns through your mind. #add_rune #epilogue_music
* You must try. #day
- I must try to sumoon every spirit at once !
->sprit_choice->
* [pattern]
-
*[...]
->->


== Epilogue ==
* A deep, dark, growl comes from all around you.
** The ground shakes like you've never felt it shake.
*** Every light disappear ...
**** ... absorbed by ...
***** ... a terrifiant cloud of darkness.
***** ... a hole in the fabric of reality.
***** ... a screaming vision of power.
- Finally ! #c #pattern
- (where_sacrifice) Where's my sacrifice, servant ? #c
    * {where_sacrifice < 2} [...] -> where_sacrifice
    * Who ... what ... are ... you ? #p
    I'm nothing. #c
    I'm everything. #c
    I'm the pattern. #c
    Where's my sacrifice ? #c
    * Your ... sacrifice ? #p
    Yes.#c
    My sacrifice.#c
    Where is it ?#c
-
* Sacrifice. #clear #hide
- (sacrifice) {|This isn't enough. I need more ! | I need more ! | More ! | Mooooore ! |  More Sacrifice !!!! | I still need one last sacrifice, servant !}#c #night
    * [Sacrifice Cilantro.] You sacrifice Cilantro.
    * [Sacrifice Fennel.] You sacrifice Fennel.
    * {sacrifice > 1} [Sacrifice Aponi.] You sacrifice Aponi.
    * {sacrifice > 1} [Sacrifice Kaya.] You sacrifice Kaya.
    * {sacrifice > 1} [Sacrifice Petrel.] You sacrifice Petrel.
    * {sacrifice > 1} [Sacrifice Hyij.] You sacrifice Hyij.
    * [Sacrifice yourself. #clear]-> self_sacrifice
- ->sacrifice

-(self_sacrifice) I am yours.#p
As you utter these words, you start to feel ...
* ... an intense pain.
** You try to scream.
*** No sound comes out.
**** Your vision starts to fade.
***** You see your runes flying around in all directions.
****** They break through the walls of your small hut and fly away.
******* As darkness eats you, one final though crosses your mind.
-
* You hope your sacrifice will quench the Pattern.
* You wonder if this is what happened to the previous Weaver.
* You did summon every spirit at once !
-
* Fin. #clear
- Merci d'avoir joué !
->->

== function my_name ==
{p_name: {p_name}|}

== function name_by_hyij
{
-i_am_the_weaver: 
{p_name: {p_name} the weaver | Weaver}
-else:
{p_name: {p_name}}
}

== function light_name_by_petrel ==
{not petrel_calls_me_by_name: Reverred Weaver}

== function name_by_petrel ==
{not petrel_calls_me_by_name: Reverred Weaver| {p_name}}

== sprit_choice ==
+ Choisissez un esprit : {known_spirits} #spirit_choice
-
->->
 