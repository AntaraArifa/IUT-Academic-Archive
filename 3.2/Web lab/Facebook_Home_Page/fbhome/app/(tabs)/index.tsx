import React from 'react';
import { ScrollView, View, StyleSheet, Text, TouchableOpacity, SafeAreaView, StatusBar } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import StoryCard from '@/components/StoryCard';
import PostCard from '@/components/PostCard';

export default function HomeScreen() {
  // Sample data for stories
  const stories = [
    {
      id: '1',
      name: 'Farhan Abid',
      profile: 'https://picsum.photos/100/100?random=1',
      image: 'https://picsum.photos/200/300?random=6',
    },
    {
      id: '2',
      name: 'Tahsin Islam Rayshad',
      profile: 'https://picsum.photos/100/100?random=2',
      image: 'https://picsum.photos/200/300?random=7',
    },
    {
      id: '3',
      name: 'Rifah Ferdous',
      profile: 'https://picsum.photos/100/100?random=3',
      image: 'https://picsum.photos/200/300?random=8',
    },
    {
      id: '4',
      name: 'Labibah Hoque',
      profile: 'https://picsum.photos/100/100?random=4',
      image: 'https://picsum.photos/200/300?random=9',
    },
    {
      id: '5',
      name: 'Lamia Rhydita',
      profile: 'https://picsum.photos/100/100?random=5',
      image: 'https://picsum.photos/200/300?random=10',
    },
  ];

  // Sample data for posts
  const posts = [
    {
      id: '1',
      name: 'Niaz Rahman',
      profile: 'https://picsum.photos/100/100?random=11',
      time: '1h',
      content: 'Photography Is My Hobby',
      images: [
        'https://picsum.photos/400/300?random=12',
        'https://picsum.photos/400/300?random=13',
      ],
      likes: 29,
      comments: 3,
    },
    {
      id: '2',
      name: 'Takia Farhin',
      profile: 'https://picsum.photos/100/100?random=14',
      time: '3h',
      content: 'Loving Europe and shifting there is the New Trend.',
      images: ['https://picsum.photos/400/300?random=15'],
      likes: 45,
      comments: 5,
    },
    {
      id: '3',
      name: 'Faiza Fatema',
      profile: 'https://picsum.photos/100/100?random=16',
      time: '5h',
      content: 'Nature is a true reflection of beauty, from the vibrant colors of flowers to the calm rhythm of the waves.  Every tree, every bird, and every breeze reminds us of the wonders around us.Loving nature isn’t just about admiring its beauty—it’s about respecting its rhythms and protecting it for future generations.  By spending time outdoors, we reconnect with ourselves and find peace in the simplicity of life.Let’s cherish the planet, live in harmony, and take action to keep its beauty alive for years to come. ',
      likes: 87,
      comments: 23,
    },
    {
      id: '4',
      name: 'Rafsina Hossain',
      profile: 'https://picsum.photos/100/100?random=17',
      time: '6h',
      content: 'Do you love cars?',
      images: ['https://picsum.photos/400/300?random=18'],
      likes: 25,
      comments: 5,
    },
    {
      id: '5',
      name: 'Reehay Sabah Samama',
      profile: 'https://picsum.photos/100/100?random=19',
      time: '8h',
      content: 'Reading books as a hobby is a gateway to endless worlds, ideas, and knowledge. It allows us to escape reality and dive into different realms, whether it’s an adventurous journey through fiction or an enlightening exploration of history or science. Books have the power to transport us, broaden our perspectives, and deepen our understanding of the world. They are companions that teach, entertain, and challenge us to think critically. Whether curled up with a novel on a rainy day or reading an inspiring biography, the act of reading nurtures our creativity, sharpens our intellect, and provides a sense of calm and focus in an otherwise busy world. It’s a hobby that not only fills time but enriches our lives in countless ways.',
      images: [],
      likes: 74,
      comments: 15,
    },
  ];

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#1877f2" />
      
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.logo}>facebook</Text>
        <View style={styles.headerIcons}>
          <TouchableOpacity style={styles.iconButton}>
            <Ionicons name="add" size={24} color="#fff" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.iconButton}>
            <Ionicons name="search" size={24} color="#fff" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.iconButton}>
            <Ionicons name="chatbubble-ellipses" size={24} color="#fff" />
            <View style={styles.badge}>
              <Text style={styles.badgeText}>5</Text>
            </View>
          </TouchableOpacity>
        </View>
      </View>

      {/* Navigation Tabs */}
      <View style={styles.tabsContainer}>
        <TouchableOpacity style={[styles.tab, styles.activeTab]}>
          <Ionicons name="home" size={24} color="#1877f2" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.tab}>
          <Ionicons name="play" size={24} color="#65676b" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.tab}>
          <Ionicons name="storefront" size={24} color="#65676b" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.tab}>
          <Ionicons name="game-controller" size={24} color="#65676b" />
        </TouchableOpacity>
        <TouchableOpacity style={styles.tab}>
          <Ionicons name="notifications" size={24} color="#65676b" />
          <View style={styles.notificationBadge}>
            <Text style={styles.badgeText}>3</Text>
          </View>
        </TouchableOpacity>
        <TouchableOpacity style={styles.tab}>
          <Ionicons name="menu" size={24} color="#65676b" />
        </TouchableOpacity>
      </View>

      <ScrollView style={styles.content} showsVerticalScrollIndicator={false}>
        {/* Create Post Section */}
        <View style={styles.createPostContainer}>
          <View style={styles.createPost}>
            <View style={styles.userAvatar}>
              <Ionicons name="person" size={20} color="#65676b" />
            </View>
            <TouchableOpacity style={styles.postInput}>
              <Text style={styles.postInputText}>What's on your mind?</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.photoButton}>
              <Ionicons name="image" size={24} color="#42b883" />
            </TouchableOpacity>
          </View>
        </View>

        {/* Stories Section */}
        <View style={styles.storiesContainer}>
          <ScrollView horizontal showsHorizontalScrollIndicator={false}>
            {stories.map((story) => (
              <StoryCard
                key={story.id}
                name={story.name}
                profile={story.profile}
                image={story.image}
              />
            ))}
          </ScrollView>
        </View>

        {/* Posts Section */}
        <View style={styles.postsContainer}>
          {posts.map((post) => (
            <PostCard
              key={post.id}
              name={post.name}
              profile={post.profile}
              time={post.time}
              content={post.content}
              images={post.images}
              likes={post.likes}
              comments={post.comments}
            />
          ))}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f0f2f5',
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: '#1877f2',
    paddingHorizontal: 16,
    paddingVertical: 12,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  logo: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
  headerIcons: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  iconButton: {
    marginLeft: 16,
    padding: 8,
    position: 'relative',
  },
  badge: {
    position: 'absolute',
    top: 0,
    right: 0,
    backgroundColor: '#e74c3c',
    borderRadius: 10,
    minWidth: 20,
    height: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  badgeText: {
    color: '#fff',
    fontSize: 12,
    fontWeight: 'bold',
  },
  tabsContainer: {
    flexDirection: 'row',
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#dadde1',
  },
  tab: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 12,
    position: 'relative',
  },
  activeTab: {
    borderBottomWidth: 3,
    borderBottomColor: '#1877f2',
  },
  notificationBadge: {
    position: 'absolute',
    top: 4,
    right: 12,
    backgroundColor: '#e74c3c',
    borderRadius: 10,
    minWidth: 20,
    height: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  content: {
    flex: 1,
  },
  createPostContainer: {
    backgroundColor: '#fff',
    marginBottom: 8,
    paddingVertical: 12,
    paddingHorizontal: 16,
  },
  createPost: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  userAvatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#e4e6ea',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
  },
  postInput: {
    flex: 1,
    borderWidth: 1,
    borderColor: '#dadde1',
    borderRadius: 25,
    paddingHorizontal: 16,
    paddingVertical: 10,
    marginRight: 12,
  },
  postInputText: {
    color: '#65676b',
    fontSize: 16,
  },
  photoButton: {
    padding: 8,
  },
  storiesContainer: {
    backgroundColor: '#fff',
    paddingVertical: 12,
    marginBottom: 8,
  },
  postsContainer: {
    paddingBottom: 20,
  },
});
