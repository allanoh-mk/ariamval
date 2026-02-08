#!/bin/bash
# Convert HEVC videos to H.264 for browser compatibility

cd assets/VIDEOS

echo "Converting videos from HEVC to H.264..."

# Convert each video
for video in *.mp4; do
    if [ -f "$video" ]; then
        output="${video%.mp4}_h264.mp4"
        echo "Converting $video to $output..."
        ffmpeg -i "$video" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$output" -y
        
        # If conversion successful, replace original
        if [ $? -eq 0 ]; then
            echo "✓ Successfully converted $video"
            mv "$output" "$video"
        else
            echo "✗ Failed to convert $video"
        fi
    fi
done

echo "All videos converted!"
