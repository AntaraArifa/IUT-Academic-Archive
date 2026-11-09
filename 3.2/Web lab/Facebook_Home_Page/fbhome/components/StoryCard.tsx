import React from 'react';
import { Image, Text, StyleSheet, TouchableOpacity } from 'react-native';

interface StoryCardProps {
  image: string;
  profile: string;
  name: string;
}

export default function StoryCard({ image, profile, name }: StoryCardProps) {
  return (
    <TouchableOpacity style={styles.container}>
      <Image source={{ uri: image }} style={styles.storyImage} />
      <Image source={{ uri: profile }} style={styles.profileImage} />
      <Text style={styles.name}>{name}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: { 
    alignItems: 'center', 
    marginHorizontal: 8,
    width: 100,
  },
  storyImage: { 
    width: 100, 
    height: 160, 
    borderRadius: 12,
    position: 'relative',
  },
  profileImage: { 
    width: 32, 
    height: 32, 
    borderRadius: 16, 
    position: 'absolute', 
    top: 8, 
    left: 8, 
    borderWidth: 3, 
    borderColor: '#1877f2',
  },
  name: { 
    marginTop: 6, 
    fontSize: 12, 
    fontWeight: '600',
    color: '#fff',
    textAlign: 'center',
    position: 'absolute',
    bottom: 8,
    left: 8,
    right: 8,
    textShadowColor: 'rgba(0, 0, 0, 0.7)',
    textShadowOffset: { width: 0, height: 1 },
    textShadowRadius: 2,
  },
});