import {DefaultThemeConfig, defineConfig4CustomTheme, SidebarItem4Shortcut, SidebarItem4ShortcutTuple} from 'vuepress/config';


export default defineConfig4CustomTheme<DefaultThemeConfig>({
  title: 'Study Notes',
  description: 'Collections of notes taken during my studies',
  base: '/study-notes/',
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
      '/notes/concurrency/': concurrencySideBar(),
      '/notes/bronet/': bronetSideBar(),
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
        , ['/notes/bronet/', 'Bronet'] as SidebarItem4ShortcutTuple
        , ['/notes/concurrency/', 'Concurrency'] as SidebarItem4ShortcutTuple
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
      [`${parent}${current}/file_structure`, 'File Structure'] as SidebarItem4ShortcutTuple,
      [`${parent}${current}/mix`, 'Mix'] as SidebarItem4ShortcutTuple,
      [`${parent}${current}/modifier`, 'Modifier'] as SidebarItem4ShortcutTuple,
      [`${parent}${current}/redefinitions_level`, 'Redefinition Level'] as SidebarItem4ShortcutTuple,
    ]
  }]
}

function bronetSideBar() {
  const parent = '/notes';
  const current = '/bronet';
  return [{
    title: 'Bronet',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/latencyandband`, 'Latency'] as SidebarItem4ShortcutTuple
    ]
  }];
}

function concurrencySideBar() {
  const parent = '/notes';
  const current = '/concurrency';
  return [{
    title: 'Concurrency',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/composing-object`, 'Composing'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/sharing-file`, 'Sharing file'] as SidebarItem4ShortcutTuple
    ]
  }];
}
