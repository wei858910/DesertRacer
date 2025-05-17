UCLASS()
class UMyGameInstance : UGameInstance
{
    bool bIsMusicPlaying = false;

    UAudioComponent MusicAudioComp;

    void PlayBGMusic()
    {
        if (!bIsMusicPlaying)
        {
            bIsMusicPlaying = true;
            USoundBase BGMusic = Cast<USoundBase>(LoadObject(nullptr, "/Game/Assets/Sounds/bg_music.bg_music"));
            if (IsValid(BGMusic))
            {
                MusicAudioComp = Gameplay::SpawnSound2D(BGMusic, VolumeMultiplier = 0.2, bPersistAcrossLevelTransition = true, bAutoDestroy = false);
            }
        }
    }
};