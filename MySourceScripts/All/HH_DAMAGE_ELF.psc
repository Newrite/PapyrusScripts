Scriptname HH_DAMAGE_ELF extends activemagiceffect  
GlobalVariable Property HH_GL_Perk_Find  Auto
GlobalVariable Property HH_GL_Perk_damage  Auto  
GlobalVariable Property HH_GL_Perk_penetr  Auto
GlobalVariable Property HH_Global_lightcritchance  Auto  
GlobalVariable Property HH_Global_Heavy_crit  Auto  
GlobalVariable Property HH_Global_Ligt_crit  Auto  
Actor Property PlayerRef  Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
float Base = 60 ; ������� ���� �������
float St2 = PlayerRef.GetActorValue("Stamina") ; ������� �������
float St1 = PlayerRef.GetBaseActorValue("Stamina") ; ����� �������
float TRDM = akTarget.GetActorValue("DamageResist") ; ����� ����
float K2 = PlayerRef.GetActorValue("Pickpocket") ; ����� ��������
float K1 = PlayerRef.GetBaseActorValue("Pickpocket") ; ����� �������� �����
float skill2 = PlayerRef.GetBaseActorValue("Sneak") ; ����� ���������� �����
float St3 = PlayerRef.GetActorValuePercentage("Stamina") ; ������� �������
int Lrandom = Utility.RandomInt(0, 99) ; ������ 
int fakechance = HH_Global_lightcritchance.GetValue() as int + HH_Global_chance.GetValue() as int; �������� ���� � ������ �� �������������
float Thealth = akTarget.GetActorValue("Health") ; �������� ����
;�������� ��� ����������
float Dmg=(((Base)*(1+ (K1*0.0055))*(1+ (St2*0.00055)))+(St1/4))*HH_GL_Perk_damage.GetValue() ; ������ ���� �� ����� ��� �����
If St3<0.3
Dmg=Dmg*0.5 ; ���� �� ��� �������, ��� ������ ������� ������ 30% ���� ����������� � ��������
Elseif Lrandom<fakechance && HH_Global_Ligt_crit.GetValue()>1
Dmg=Dmg*HH_Global_Ligt_crit.GetValue()
Float crit = HH_Global_Ligt_crit.GetValue(); 2.5 ��������
Int whole = crit as Int ; 2
Float decimal = (crit - whole) * 10 ; 
Debug.Notification("����������� ���� x" + whole + "." + decimal as Int ) 
;Debug.Notification("����������" +fakechance)
;Debug.Notification("������ �����" +Lrandom)
HH_Global_chance.SetValueInt(0)
Elseif Lrandom>fakechance&& HH_Global_Ligt_crit.GetValue()>1
HH_Global_chance.SetValueInt((HH_Global_chance.GetValue() as int) + (HH_Global_lightcritchance.GetValue() as int))
;Debug.Notification("���� � �����" +HH_Global_chance.GetValueInt())
endif
if akTarget.HasKeyword(ActorTypeGhost)|| akTarget.HasKeyword(ActorTypeUndead)
Dmg=Dmg*0.1
endIf
float penetr= 0.08 + HH_GL_Perk_penetr.GetValue()+((K2-K1)*0.005) ; �������� 
if penetr>0.8
penetr = 0.8
endIf
if (akTarget.HasKeyword(ActorTypeDwarven)) 
TRDM=TRDM+200
endIf
float Arleft = TRDM-(TRDM*penetr)
float percent = Arleft*0.12 ; ������� ������� �������� �� ����
if percent >80 
percent = 80
endif
float damage = (Dmg-(Dmg*(percent/100)))*Game.GetGameSettingFloat("fDiffMultHPByPCVH") ; �������� ����
if (!akTarget.IsDead())&& damage > 0 && damage < Thealth
akTarget.DamageActorValue("Health", damage)
Elseif (!akTarget.IsDead())&& damage > Thealth
akTarget.Kill(PlayerRef)
endIf
;Debug.Notification("���������� ���� " +damage)
int random = Utility.RandomInt(0, 99)
	if (random < HH_GL_Perk_Find.GetValueInt())&&!akTarget.IsPlayerTeammate()&&(!akTarget.HasKeyword(ActorTypeDwarven))
			akTarget.AddItem(Misc1, 1, true)
		endIf
endevent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
HH.Value += 1
endevent
MiscObject Property Misc1  Auto 
GlobalVariable Property HH  Auto
Keyword Property Vampire  Auto  
Keyword Property ActorTypeDwarven  Auto  
Keyword Property ActorTypeGhost  Auto  
Keyword Property ActorTypeUndead  Auto  
GlobalVariable Property HH_Global_chance  Auto 