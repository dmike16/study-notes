import {DefaultThemeConfig, defineConfig4CustomTheme, SidebarItem4Shortcut, SidebarItem4ShortcutTuple} from 'vuepress/config';


export default defineConfig4CustomTheme<DefaultThemeConfig>({
  title: 'Study Notes',
  description: 'Collections of notes taken during my studies',
  theme: 'default-prefers-color-scheme',
  themeConfig: {
    lastUpdated: 'Last Updated',
    editLinks: false,
    repo: 'dmike16/study-notes',
    docsBranch: 'main',
    smoothScroll: true,
    logo: './images/brain.png',
    nav: [
      {text: 'Notes', link: '/notes/'}
    ],
    sidebar: {
      '/notes/bem/': bemSideBar(),
      '/notes/': notesSideBar(),

      '/': rootSideBar(),

    }
  }
})


function rootSideBar() {
  return [{
    title: 'Readme',
    path: '/',
    collapsable: true,
    sidebarDepth: 1,
    children: []
  }]
}

function notesSideBar() {
  return [
    {
      title: 'Notes',
      path: '/notes/',
      sidebarDepth: 1,
      children: [
        ['/notes/bem/', 'BEM'] as SidebarItem4ShortcutTuple
      ]
    }
  ]
}

function bemSideBar() {
  const parent = '/notes';
  const current = '/bem'
  return [{
    title: 'BEM',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/block`, 'Block'] as SidebarItem4ShortcutTuple,
      [`${parent}${current}/element`, 'Element'] as SidebarItem4ShortcutTuple,
    ]
  }]
}
