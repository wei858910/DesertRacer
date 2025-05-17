class AMyGameMode : AGameModeBase
{
    UClass PawnClass = Cast<UClass>(LoadObject(nullptr, "/Game/BP/BP_PlayerCharacter.BP_PlayerCharacter_C"));
    default DefaultPawnClass = PawnClass;
    
    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
    }
};