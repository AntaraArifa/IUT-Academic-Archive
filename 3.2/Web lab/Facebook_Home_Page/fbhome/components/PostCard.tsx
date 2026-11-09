import React from 'react';
import { View, Image, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { Ionicons, AntDesign } from '@expo/vector-icons';

interface PostCardProps {
  profile: string;
  name: string;
  time: string;
  content: string;
  images?: string[];
  likes: number;
  comments: number;
}

export default function PostCard({ 
  profile, 
  name, 
  time, 
  content, 
  images, 
  likes, 
  comments 
}: PostCardProps) {
  return (
    <View style={styles.card}>
      {/* Header with profile and name */}
      <View style={styles.header}>
        <Image source={{ uri: profile }} style={styles.profileImage} />
        <View style={styles.headerText}>
          <Text style={styles.name}>{name}</Text>
          <View style={styles.metaContainer}>
            <Text style={styles.time}>{time}</Text>
            <Text style={styles.globe}> · 🌐</Text>
          </View>
        </View>
        <TouchableOpacity style={styles.moreButton}>
          <Ionicons name="ellipsis-horizontal" size={20} color="#65676b" />
        </TouchableOpacity>
      </View>

      {/* Post content */}
      <Text style={styles.content}>{content}</Text>

      {/* Post images */}
      {images && images.length > 0 && (
        <View style={styles.imageContainer}>
          {images.length === 1 ? (
            <Image source={{ uri: images[0] }} style={styles.singleImage} />
          ) : (
            <View style={styles.multiImageContainer}>
              {images.slice(0, 2).map((image, index) => (
                <Image key={index} source={{ uri: image }} style={styles.multiImage} />
              ))}
            </View>
          )}
        </View>
      )}

      {/* Reactions and comments */}
      <View style={styles.statsContainer}>
        <View style={styles.reactions}>
          <View style={styles.reactionIcons}>
            <AntDesign name="like1" size={16} color="#3b5998" />
            <AntDesign name="heart" size={16} color="#e74c3c" />
            <AntDesign name="smileo" size={16} color="#f39c12" style={{marginLeft: -4}} />
          </View>
          <Text style={styles.statsText}>{likes}</Text>
        </View>
        <Text style={styles.commentsText}>{comments} comments</Text>
      </View>

      {/* Action buttons */}
      <View style={styles.separator} />
      <View style={styles.actionButtons}>
        <TouchableOpacity style={styles.actionButton}>
          <AntDesign name="like2" size={18} color="#65676b" />
          <Text style={styles.actionText}>Like</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.actionButton}>
          <Ionicons name="chatbubble-outline" size={18} color="#65676b" />
          <Text style={styles.actionText}>Comment</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.actionButton}>
          <Ionicons name="arrow-redo-outline" size={18} color="#65676b" />
          <Text style={styles.actionText}>Share</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#fff',
    marginVertical: 4,
    paddingVertical: 12,
    borderRadius: 0,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    marginBottom: 12,
  },
  profileImage: {
    width: 40,
    height: 40,
    borderRadius: 20,
    marginRight: 12,
  },
  headerText: {
    flex: 1,
  },
  name: {
    fontSize: 15,
    fontWeight: '600',
    color: '#1c1e21',
  },
  metaContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  time: {
    fontSize: 13,
    color: '#65676b',
  },
  globe: {
    fontSize: 13,
    color: '#65676b',
  },
  moreButton: {
    padding: 8,
  },
  content: {
    fontSize: 14,
    lineHeight: 20,
    color: '#1c1e21',
    paddingHorizontal: 16,
    marginBottom: 12,
  },
  imageContainer: {
    marginBottom: 12,
  },
  singleImage: {
    width: '100%',
    height: 250,
    resizeMode: 'cover',
  },
  multiImageContainer: {
    flexDirection: 'row',
    height: 250,
  },
  multiImage: {
    flex: 1,
    height: '100%',
    resizeMode: 'cover',
    marginHorizontal: 1,
  },
  statsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 16,
    marginBottom: 8,
  },
  reactions: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  reactionIcons: {
    flexDirection: 'row',
    marginRight: 6,
  },
  statsText: {
    fontSize: 14,
    color: '#65676b',
  },
  commentsText: {
    fontSize: 14,
    color: '#65676b',
  },
  separator: {
    height: 1,
    backgroundColor: '#dadde1',
    marginHorizontal: 16,
    marginBottom: 8,
  },
  actionButtons: {
    flexDirection: 'row',
    paddingHorizontal: 16,
  },
  actionButton: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 8,
  },
  actionText: {
    fontSize: 14,
    color: '#65676b',
    fontWeight: '600',
    marginLeft: 6,
  },
});
