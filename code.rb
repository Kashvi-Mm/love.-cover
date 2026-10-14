use_bpm 62

sleep 2

# Drums
live_loop :drums do
  kick_pattern  = [1, 0, 1, 0, 0, 1, 1, 0]
  snare_pattern = [0, 0, 1, 0, 0, 0, 1, 0]
  hihat_pattern = [1, 1, 1, 1, 1, 1, 1, 1]
  
  8.times do |i|
    # Kick drum
    sample :bd_haus, amp: 0.8, cutoff: 85 if kick_pattern[i] == 1
    
    # Snare
    sample :sn_dolf, amp: 0.3, finish: 0.61 if snare_pattern[i] == 1
    
    # Hi-Hat
    sample :drum_cymbal_closed, amp: 0.3, attack: 0.002, release: 0.08 if hihat_pattern[i] == 1
    
    sleep 0.5
  end
end

# Chords
live_loop :chords do
  use_synth :fm
  
  # A
  play [:A2, :E3, :A3, :Cs4, :E4], attack: 0.1, sustain: 3, release: 1, amp: 0.5
  sleep 4
  
  # Aaug
  play [:A2, :F3, :A3, :Cs4, :F4], attack: 0.1, sustain: 3, release: 1, amp: 0.5
  sleep 4
  
  # Dmaj7
  play [:D3, :Fs3, :A3, :Cs4, :Fs4], attack: 0.1, sustain: 3, release: 1, amp: 0.5
  sleep 4
  
  # Dm
  play [:D3, :F3, :A3, :D4, :F4], attack: 0.1, sustain: 3, release: 1, amp: 0.5
  sleep 4
  
end

# Bass
live_loop :bass do
  use_synth :fm
  use_synth_defaults divisor: 1, depth: 0.1, attack: 0.05, sustain: 0.2, release: 0.2, amp: 0.6
  
  sleep 2
  play :a1; sleep 2
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 1.5
  play :d2; sleep 0.5
  
  play :d2; sleep 2
  play :d2; sleep 0.75
  play :d2; sleep 0.25

  sleep 1
end

# Intro Melody
use_synth :saw
with_fx :reverb, room: 0, mix: 0.65 do
  with_fx :lpf, cutoff: 80, res: 0 do
    
    # Layer 1
    play_pattern_timed [:a3, :b3, :cs4, :d4, :e4, :fs4, :gs4, :a4], [0.5], release: 1
    
    play_pattern_timed [:f4, :fs4, :gs4, :a4, :b4, :cs5, :b4, :a4, :gs4], [0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.5, 0.5, 0.5], release: 1
    
    play_pattern_timed [:fs4, :cs5, :b4, :a4, :f4, :cs5, :b4, :a4], [1], release: 1.5
    
    # Layer 2
    in_thread do
      play_pattern_timed [:cs4, :d4, :e4, :fs4, :gs4, :a4, :b4, :cs5], [0.5], release: 1, amp: 0.3
      
      play_pattern_timed [:gs4, :a4, :b4, :cs5, :e5, :e5, :cs5, :b4], [0.5], release: 1, amp: 0.3
      
      play_pattern_timed [:a4, :e5, :d5, :cs5, :f5, :e5, :d5, :e5], [1], release: 1.5, amp: 0.3
    end
    
    # Layer 1 cont.d
    play_pattern_timed [:a3, :b3, :cs4, :d4, :e4, :fs4, :gs4, :a4], [0.5], release: 1
    
    play_pattern_timed [:f4, :fs4, :gs4, :a4, :b4, :cs5, :b4, :a4, :gs4], [0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.5, 0.5, 0.5], release: 1
    
    play_pattern_timed [:fs4, :cs5, :b4, :a4, :cs5, :d5, :cs5, :b4, :b4, :cs5, :a4], [1, 1, 1, 1, 0.25, 0.75, 1, 1, 0.25, 0.75, 1], release: 1.5
    
  end
end