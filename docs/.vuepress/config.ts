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
      '/notes/webfundamentals/': webfundamentalSideBar(),
      '/notes/concurrency/': concurrencySideBar(),
      '/notes/bronet/': bronetSideBar(),
      '/notes/nginx/': nginxSideBar(),
      '/notes/nodejs/': nodejsSideBar(),
      '/notes/bem/': bemSideBar(),
      '/notes/rxjs/': rxjsSideBar(),
      '/notes/': notesSideBar(),

      '/': rootSideBar(),

    }
  },
  markdown: {
    lineNumbers: true,
  },
  configureWebpack: {
    resolve: {
      alias: {
        '@webfundImages': '../images'
      }
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
        , ['/notes/nginx/', 'Nginx'] as SidebarItem4ShortcutTuple
        , ['/notes/nodejs/', 'NodeJs'] as SidebarItem4ShortcutTuple
        , ['/notes/rxjs/', 'RxJs'] as SidebarItem4ShortcutTuple
        , ['/notes/webfundamentals/', 'Web fundamental'] as SidebarItem4ShortcutTuple
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


function nginxSideBar() {
  const parent = '/notes';
  const current = '/nginx';
  return [{
    title: 'Nginx',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/configuration`, 'Configuration'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/ubuntu1804-setup`, 'Ubuntu1804 setup'] as SidebarItem4ShortcutTuple
    ]
  }];
}

function nodejsSideBar() {
  const parent = '/notes';
  const current = '/nodejs';
  return [{
    title: 'NodeJs',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/event-loop`, 'Event Loop'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/backpressuring`, 'Backpressure'] as SidebarItem4ShortcutTuple
    ]
  }];
}

function rxjsSideBar() {
  const parent = '/notes';
  const current = '/rxjs';
  return [{
    title: 'RxJs',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/architecture`, 'Architecture'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/observable`, 'Observable'] as SidebarItem4ShortcutTuple
    ]
  }];
}

function webfundamentalSideBar() {
  const parent = '/notes';
  const current = '/webfundamentals';
  return [{
    title: 'PWA',
    path: `${parent}${current}/`,
    children: [
      [`${parent}${current}/app-shell`, 'App Shell'] as SidebarItem4ShortcutTuple
    ]
  },
  {
    title: 'UX',
    path: `${parent}${current}/design-ux`,
    children: [
      [`${parent}${current}/design-ux/accessibility`, 'Accessibility'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/design-ux/practice`, 'Practice'] as SidebarItem4ShortcutTuple
    ]
  },
  {
    title: 'Push Proto',
    path: `${parent}${current}/push`,
    children: [
      [`${parent}${current}/push/web-push-protocol`, 'Web Push Proto'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/push/register-service-worker`, 'Register'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/push/subscribe`, 'Subscribe'] as SidebarItem4ShortcutTuple
      , [`${parent}${current}/push/unsubscribe`, 'Unsubscribe'] as SidebarItem4ShortcutTuple
    ]
  }];
}
